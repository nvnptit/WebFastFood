package ptithcm.controller;

import java.io.File;
import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ptithcm.entity.Product;
import ptithcm.entity.User;

@Transactional
@Controller
@RequestMapping("/admin/")
public class AdminController {
	@Autowired
	SessionFactory factory;
	@Autowired
	ServletContext context;
	@Autowired
	JavaMailSender mailer;
	
	//MARK: -DANG NHAP - DANG KI - QUEN MAT KHAU
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login_admin(ModelMap model) {
		return "admin/login";
	}
	
	@RequestMapping(value="logout")
	public String logout_user(HttpServletResponse response, HttpServletRequest resquest) throws IOException {
		Cookie ck=new Cookie("authadmin",null);  
        ck.setMaxAge(0);
		resquest.getSession().removeAttribute("user1");
        response.addCookie(ck); 
        response.sendRedirect("/WebFastFood/admin/login.htm");
       return "admin/login";
	}
	
	@RequestMapping(value="forgot", method = RequestMethod.GET)
	public String forgot_admin() {
		return "admin/forgotpassword";
	}
	
	@RequestMapping(value="forgot", method = RequestMethod.POST)
	public String forgot_post(HttpServletRequest request, ModelMap model) {
		String username = request.getParameter("username");
		Session session2 = factory.openSession();
		Transaction t = session2.beginTransaction();
		String hql = "FROM User WHERE role = :admin ";
		Query query = session2.createQuery(hql).setParameter("admin", "admin");
		List<User> list = query.list();
		
		boolean check = false;
		User currentUser = null;
		
		for (int i = 0; i < list.size(); i++) {
			 String str = list.get(i).getUsername().trim();
			 if (username.equals(str)) {
				 currentUser = list.get(i);
				 check = true;
				 break;
			 } else {
				 continue;
			 }
			}
		if(check) {
			try {
				String email = currentUser.getEmail();
				String randomPass = getRandomPassword(10);
				String mahoa = md5(randomPass);
				String from = "codervn77@gmail.com";
				String to = email;
				String subject = "YOUR PASSWORD";
				String body = "Mật khẩu của bạn : " + randomPass;
				currentUser.setPassword(mahoa);
				session2.update(currentUser);
				
				MimeMessage mail = mailer.createMimeMessage();
				
				MimeMessageHelper helper = new MimeMessageHelper(mail);
				helper.setFrom(from, from);
				helper.setTo(to);
				helper.setReplyTo(from,from);
				helper.setSubject(subject);
				helper.setText(body);
				mailer.send(mail);
				
				t.commit();
				model.addAttribute("message", "Mật khẩu được gửi tới mail của bạn!");
			} catch (Exception e) {
				t.rollback();
				model.addAttribute("message", "Gửi mail thất bại, hãy gửi lại!");
			} finally {
				session2.close();
			}
		} else {
			model.addAttribute("message", "Tài khoản không tồn tại!");
		}
		return "admin/forgotpassword";
	}
	
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String index_amdin() {
		return "admin/index";
	}
	@RequestMapping(value = "index", method = RequestMethod.POST)
	public String login_admin(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws IOException {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		password = md5(password);
		String value = md5(username);
		Cookie ck=new Cookie("authadmin", value);
		ck.setMaxAge(600);
	
		HttpSession session = request.getSession();
		Session session1 = factory.getCurrentSession();
		String hql = "FROM User WHERE role = :admin ";
		Query query = session1.createQuery(hql).setParameter("admin", "admin");
		List<User> list = query.list();
		
		boolean check = false;
		User currentUser = null;
		
		for (int i = 0; i < list.size(); i++) {
			 String str = list.get(i).getUsername().trim();
			 if (username.equals(str)) {
				 currentUser = list.get(i);
				 check = true;
				 break;
			 } else {
				 continue;
			 }
			}
		if (check) {
			if (password.equals(currentUser.getPassword().trim())) {
				model.addAttribute("message", "OK");
				model.addAttribute("username", username);
				session.setAttribute("user1", currentUser);
				session.setAttribute("role", currentUser.getRole());
				response.addCookie(ck);
				response.sendRedirect("index.htm");
			} else {
				model.addAttribute("message", "Tên đăng nhập hoặc mật khẩu không đúng!");
			}
		} else {
				model.addAttribute("message", "Bạn không có quyền truy cập vào quản trị");
		}
		return "admin/login";
	}
	

	@RequestMapping(value = "user", method = RequestMethod.GET)
	public String table_user(ModelMap model) {
		model.addAttribute("users", getUsers());
		return "admin/user";
	}

	@RequestMapping(value = "product", method = RequestMethod.GET)
	public String page_product(HttpServletRequest request, ModelMap model, @ModelAttribute("product") Product product) {
		List<Product> products = this.getProducts();
		@SuppressWarnings("unchecked")
		PagedListHolder pagedListHolder = new PagedListHolder(products);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(50);
		pagedListHolder.setPageSize(5);
		model.addAttribute("pagedListHolder", pagedListHolder);
		return "admin/product";
	}
	
	@RequestMapping(value="delete/user/{username}", method = RequestMethod.GET)
	public String delete(HttpServletRequest request, HttpServletResponse response, ModelMap model, @PathVariable("username") String username) throws IOException {
		Session session = factory.getCurrentSession();
		Criteria crit = session.createCriteria(User.class);
		crit.add(Restrictions.eq("username", username));
		User user = (User) crit.uniqueResult();
		Cookie[] cks = request.getCookies();
		String cksusername = cks[0].getValue();
			if(user != null) {
				if (!user.getUsername().equals(cksusername)) {
					this.factory.getCurrentSession().delete(user);
					model.addAttribute("users",	getUsers());
				} else {
					this.factory.getCurrentSession().delete(user);
		// CHưa trả về thông báo xoá thành công
					return "redirect:/admin/logout.htm";
				}
			}
		return "redirect:/admin/user.htm";
	}
	
	@RequestMapping(value="delete/product/{id}", method = RequestMethod.GET)
	public String delete_product(ModelMap model, @PathVariable("id") String id) {
		Session session = factory.getCurrentSession();
		Criteria crit = session.createCriteria(Product.class);
		crit.add(Restrictions.eq("id", id));
		Product product = (Product) crit.uniqueResult();
			if(product != null ) {
				this.factory.getCurrentSession().delete(product);
				model.addAttribute("products",	getProducts());
			}
		return "redirect:/admin/product.htm";
	}

	
	@SuppressWarnings("unchecked")
	@ModelAttribute("users")
	public List<User> getUsers() {
		Session session = factory.getCurrentSession();
		String hql = "FROM User";
		Query query = session.createQuery(hql);
		List<User> list = query.list();
		return list;
	}

	@SuppressWarnings("unchecked")
	@ModelAttribute("products")
	public List<Product> getProducts() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Product";
		Query query = session.createQuery(hql);
		List<Product> list = query.list();
		return list;
	}
	
	@ModelAttribute("roles")
	public Map<String,String> getRoles(){
		Map<String,String> mj = new HashMap<>();
		mj.put("admin","Admin");
		mj.put("user","User");
		return mj;
	}
	
	@RequestMapping(value="changepassword", method = RequestMethod.GET)
	public String changepassword() {
		return "admin/changepassword";
	}
	
	@RequestMapping(value="changepassword", method=RequestMethod.POST)
	public String changepassword(HttpServletRequest request,ModelMap model) {
		String oldpass = request.getParameter("oldpass");
		String newpass = request.getParameter("newpass");
		String confirmpass = request.getParameter("confirmpass");
	
		HttpSession httpSession = request.getSession();
		
		User user = (User) httpSession.getAttribute("user");
		String pass_md5 = md5(oldpass);
		if (!pass_md5.equals(user.getPassword())) {
			model.addAttribute("message", "Mật khẩu cũ không đúng!");
		} else {
			if (!newpass.equals(confirmpass)) {
				model.addAttribute("message", "Mật khẩu xác nhận không trùng với mật khẩu mới!");
			} else {
				Session session2 = factory.openSession();
				Transaction t = session2.beginTransaction();
				user.setPassword(md5(newpass));
				try {
					session2.update(user);
					t.commit();
					model.addAttribute("message", "Thay mật khẩu thành công!");
				} catch (Exception e) {
					t.rollback();
					model.addAttribute("message", "Thay mật khẩu thất bại!");
				} finally {
					session2.close();
				}
			}
		}
		
		return "admin/changepassword";
	}
		
	@RequestMapping(value="form_user", method = RequestMethod.GET)
	public String form_user(ModelMap model) {
		model.addAttribute("user", new User());
		return "admin/form_user";
	}
	
	@RequestMapping(value="form_product", method = RequestMethod.GET)
	public String form_product(ModelMap model) {
		model.addAttribute("product", new Product());
		return "admin/form_product";
	}
	
	@RequestMapping("form_user/{username}")
	public String update(ModelMap model, @PathVariable("username") String username) {
		Session session = factory.getCurrentSession();
		User user = (User) session.get(User.class, username);
		model.addAttribute("user", user);
		model.addAttribute("users", getUsers());
		return "admin/form_user";
	}
	
	@RequestMapping("product_update/{id}")
	public String update_product(ModelMap model, @PathVariable("id") String id) {
		Session session = factory.getCurrentSession();
		Product product = (Product) session.get(Product.class, id);
		model.addAttribute("product", product);
		model.addAttribute("products", getProducts());
		return "admin/product_update";
	}
	
	
	@RequestMapping(value = "form_user/update", method = RequestMethod.POST)
	public String update(ModelMap model, @ModelAttribute("user") User user) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(user);
			t.commit();
			model.addAttribute("message", "Cập nhật thành công!");
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Cập nhật thất bại!");
		} finally {
			session.close();
		}
		return "admin/form_user";
	}
	
	@RequestMapping(value = "form_user/insert", method = RequestMethod.POST)
	public String insert_admin(ModelMap model, @ModelAttribute("user") User user) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			String randomPass = getRandomPassword(10);
			String mahoa = md5(randomPass);
			String from = "codervn77@gmail.com";
			String to = user.getEmail();
			String subject = "YOUR PASSWORD";
			String body = "Mật khẩu của bạn : " + randomPass;
			
			MimeMessage mail = mailer.createMimeMessage();
			
			MimeMessageHelper helper = new MimeMessageHelper(mail);
			helper.setFrom(from, from);
			helper.setTo(to);
			helper.setReplyTo(from,from);
			helper.setSubject(subject);
			helper.setText(body);
			
			mailer.send(mail);
			user.setPassword(mahoa);
			session.save(user);
			t.commit();
			model.addAttribute("message", "Thêm mới thành công, mật khẩu của bạn đã gửi đến mail!");
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Thêm mới thất bại!");
		} finally {
			session.close();
		}
		return "admin/form_user";
	}
	
	@RequestMapping(value = "form_product/insert", method = RequestMethod.POST)
	public String insert_product(ModelMap model, @ModelAttribute("product") Product product, @RequestParam("file") MultipartFile file) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		if (file.isEmpty()) {
			model.addAttribute("message", "Vui lòng chọn file!");
		} else {
				
				try {
					String photoPath = context.getRealPath("./images/" + file.getOriginalFilename());
					file.transferTo(new File(photoPath));
					product.setImg(file.getOriginalFilename());
					session.save(product);
					t.commit();
					model.addAttribute("message", "Cập nhật thành công!");
				} catch (Exception e) {
					t.rollback();
					model.addAttribute("message", "Cập nhật thất bại!");
				} finally {
					session.close();
				}
		}
		return "admin/product_update";
	}
	
	@RequestMapping(value = "form_product/update", method = RequestMethod.POST)
	public String update_product(ModelMap model, @ModelAttribute("product") Product product, @RequestParam("file") MultipartFile file) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		if (file.isEmpty()) {
			model.addAttribute("message", "Vui lòng chọn file!");
		} else {
				
				try {
					String photoPath = context.getRealPath("./images/" + file.getOriginalFilename());
					file.transferTo(new File(photoPath));
					product.setImg(file.getOriginalFilename());
					session.update(product);
					t.commit();
					model.addAttribute("message", "Cập nhật thành công!");
				} catch (Exception e) {
					t.rollback();
					model.addAttribute("message", "Cập nhật thất bại!");
				} finally {
					session.close();
				}
		}
		return "admin/product_update";
	}
	
	private String md5(String str) {
		// TODO Auto-generated method stub
		String result = "";
		MessageDigest digest;
		try {
			digest = MessageDigest.getInstance("MD5");
			digest.update(str.getBytes());
			BigInteger bigInteger = new BigInteger(1,digest.digest());
			result = bigInteger.toString(16);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	static String getRandomPassword(int n) 
    { 
  
        // chose a Character random from this String 
        String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                    + "0123456789"
                                    + "abcdefghijklmnopqrstuvxyz"; 
  
        // create StringBuffer size of AlphaNumericString 
        StringBuilder sb = new StringBuilder(n); 
  
        for (int i = 0; i < n; i++) { 
  
            // generate a random number between 
            // 0 to AlphaNumericString variable length 
            int index 
                = (int)(AlphaNumericString.length() 
                        * Math.random()); 
  
            // add Character one by one in end of sb 
            sb.append(AlphaNumericString 
                          .charAt(index)); 
        } 
  
        return sb.toString(); 
    }
	
}
