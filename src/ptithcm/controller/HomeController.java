package ptithcm.controller;

import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
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

import ptithcm.entity.Orders;
import ptithcm.entity.Product;
import ptithcm.entity.User;

@Transactional
@Controller
@RequestMapping("/home/")
public class HomeController {
	@Autowired
	SessionFactory factory;
	@Autowired
	JavaMailSender mailer;
	
	/* Login-SignUp-Forgot-Logout */
	//Login
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login_user() {
		return "/home/login";
	}
	//Signup
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login_post(HttpServletRequest request, ModelMap model) {
		String username = request.getParameter("username");
		String fullname = request.getParameter("fullname");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		String role = request.getParameter("role");
		
		if(!password.equals(confirmPassword)) {
			model.addAttribute("message", "Mật khẩu không trùng khớp!");
			return "home/login";
		} else {
			Session session1 = factory.getCurrentSession();
			String hql = "FROM User WHERE username = :username";
			Query query = session1.createQuery(hql).setParameter("username", username);
			@SuppressWarnings("unchecked")
			List<User> list = query.list();
			
			if (list.size() > 0 ) {
				model.addAttribute("message", "Username đã tồn tại, mời bạn đăng kí tài khoản khác!");
				return "home/login";
			} else {
				Session session = factory.openSession();
				Transaction t = session.beginTransaction();
				try {
					
					User user = new User(username,md5(password),role,fullname,email,phone);
					session.save(user);
					t.commit();
				} catch (Exception e) {
					t.rollback();
					model.addAttribute("message", "Đăng Kí Thất Bại!");
				} finally {
					session.close();
				}
				return "home/login";
			}			
		}
	}
	// Forgot
	@RequestMapping(value="forgot", method = RequestMethod.GET)
	public String forgot_user() {
		return "admin/forgotpassword";
	}
	// Forgot
	@SuppressWarnings("unchecked")
	@RequestMapping(value="forgot", method = RequestMethod.POST)
	public String forgot_post(HttpServletRequest request, ModelMap model) {
		String username = request.getParameter("username");
		Session session2 = factory.openSession();
		Transaction t = session2.beginTransaction();
		String hql = "FROM User WHERE username = :username ";
		Query query = session2.createQuery(hql).setParameter("username", username );
		List<User> list = query.list();
		
		if(list.size()>0) {
			User currentUser = list.get(0);
			try {
				
				String email = currentUser.getEmail();
				String randomPass = getRandomPassword(10);
				String mahoa = md5(randomPass);
				String from = "codervn77@gmail.com";
				String to = email;
				String subject = "YOUR PASSWORD";
				String body = "Mật khẩu khôi phục của bạn nè : " + randomPass;
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
				model.addAttribute("message", "Mật khẩu mới đã được gửi tới mail đăng kí!");
			} catch (Exception e) {
				t.rollback();
				model.addAttribute("message", "Gửi mail thất bại, hãy thử lại!");
			} finally {
				session2.close();
			}
		} else {
			model.addAttribute("message", "Tài khoản của bạn không tồn tại!");
		}
		return "admin/forgotpassword";
	}
	
	// Logout
	@RequestMapping(value="logout")
	public String logout_user(HttpServletResponse response, HttpServletRequest resquest) throws IOException {
		
		Cookie ck=new Cookie("auth",null);  //"logout"
        ck.setMaxAge(0);
        resquest.getSession().removeAttribute("Orders");
        resquest.getSession().removeAttribute("Orders_list");
        resquest.getSession().removeAttribute("user");
        response.addCookie(ck); 
        response.sendRedirect("/WebFastFood/home/index.htm");
       return "home/index";
	}
	
	// Changepass
	@RequestMapping(value="profile", method= RequestMethod.GET)
	public String profile() {
		return "/home/profile";
	}
	@RequestMapping(value="profile", method=RequestMethod.POST)
	public String postProfile(HttpServletRequest request, ModelMap model){
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
				model.addAttribute("message", "Mật khẩu không trùng khớp!");
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
		return "/home/profile";
	}
	
	// Index
	@RequestMapping(value="index", method= RequestMethod.GET)
	public String index_user(ModelMap model) {
		model.addAttribute("products", getProducts());
		return "home/index";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value="index", method = RequestMethod.POST)
	public String index_login(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String username = request.getParameter("username_lg");
		if (username==null){
			model.addAttribute("message", "Bạn phải đăng nhập vào trước!!!");
			return "home/index";
		}
		username = username.trim();
		String password = request.getParameter("password_lg");
		password = password.trim();
		password = md5(password).trim();
		
		HttpSession session = request.getSession();
		Session session1 = factory.getCurrentSession();
		String hql = "FROM User";
		Query query = session1.createQuery(hql);
		List<User> list = query.list();

		// Kiểm tra captcha
		String captcha = session.getAttribute("captcha_security").toString();
		String verifyC = request.getParameter("captcha");

		if (!captcha.equals(verifyC)){
			model.addAttribute("recaptcha","Vui lòng nhập đúng captcha");
			model.addAttribute("message", "Vui lòng nhập đúng captcha");
			return "home/login";
		}

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
				model.addAttribute("username", username);
				model.addAttribute("user", currentUser);
				model.addAttribute("message", "Cập nhật mật khẩu thành công!");
				session.setAttribute("user", currentUser);
				session.setAttribute("role", currentUser.getRole());
				Cookie ck=new Cookie("auth", md5(username));
				
				ck.setMaxAge(600);
				response.addCookie(ck);
				response.sendRedirect("index.htm");
			} else {
				model.addAttribute("message", "Sai mật khẩu! Mời đăng nhập lại!");
			}
		} else {
			model.addAttribute("message", "Sai thông tin tài khoản. Mời đăng nhập lại");
		}	
		return "/home/index";
	}
	// Shop
	@RequestMapping(value = "shop", method = RequestMethod.GET)
	public String shop(ModelMap model) {
		model.addAttribute("products", getProducts());
		return "home/shop";
	}
	//food
	/*
	 * @RequestMapping(value = "food", method = RequestMethod.GET) public String
	 * food(ModelMap model) { model.addAttribute("products", getFoods()); return
	 * "home/food"; }
	 */
	
	@RequestMapping(value = "food", method = RequestMethod.GET)
	public String food(HttpServletRequest request, ModelMap model, @ModelAttribute("product") Product product) {
		List<Product> products = this.getFoods();
		@SuppressWarnings("unchecked")
		PagedListHolder pagedListHolder = new PagedListHolder(products);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(20);
		pagedListHolder.setPageSize(5);
		model.addAttribute("pagedListHolder", pagedListHolder);

		return "home/food";
	}
	
	//drink
	/*
	 * @RequestMapping(value = "drink", method = RequestMethod.GET) public String
	 * drink(ModelMap model) { model.addAttribute("products", getDrinks()); return
	 * "home/drink"; }
	 */
	
	@RequestMapping(value = "drink", method = RequestMethod.GET)
	public String drink(HttpServletRequest request, ModelMap model, @ModelAttribute("product") Product product) {
		List<Product> products = this.getDrinks();
		@SuppressWarnings({ "unchecked", "rawtypes" })
		PagedListHolder pagedListHolder = new PagedListHolder(products);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(20);
		pagedListHolder.setPageSize(5);
		model.addAttribute("pagedListHolder", pagedListHolder);

		return "home/drink";
	}
	
	// Single Product
	@RequestMapping(value = "single", method = RequestMethod.GET)
	public String single() {
		return "/home/single";
	}
	// Blog
	@RequestMapping(value = "blog", method = RequestMethod.GET)
	public String blog() {
		return "/home/blog";
	}
	
	@RequestMapping(value = "blog-inside", method = RequestMethod.GET)
	public String blog_inside() {
		return "/home/blog-inside";
	}
	
	@RequestMapping(value = "about", method = RequestMethod.GET)
	public String about() {
		return "/home/about";
	}
	// Cart
	@RequestMapping(value = "cart", method = RequestMethod.GET)
	public String cart() {
		return "/home/cart";
	}
	@RequestMapping(value = "record", method = RequestMethod.GET)
	public String record_get(ModelMap model) {
		model.addAttribute("message", "BẠN CHƯA ĐẶT ĐƠN HÀNG NÀO!");
		return "home/record";
	}
	
	@RequestMapping(value = "record", method = RequestMethod.POST)
	public String record(HttpServletRequest request, ModelMap model, HttpSession session) {
		Session session1 = factory.openSession();
		Transaction t = session1.beginTransaction();
		String[] id = request.getParameterValues("id");
		String[] name = request.getParameterValues("name");
		
		String[] price = request.getParameterValues("price");
		String[] quantity = request.getParameterValues("quantity");
		String[] discount = request.getParameterValues("discount");
		String[] total = request.getParameterValues("total");
		

		String receiver = request.getParameter("receiver");
		String address = request.getParameter("address");
		String sdt = request.getParameter("sdt");
		String total_amount = request.getParameter("total_amount");
		 
		String from = "codervn77@gmail.com";
		User user = (User) session.getAttribute("user");
		String to = user.getEmail();
		String subject = "[ ĐƠN ĐẶT HÀNG CỦA BẠN ]";
		String body = "";
		User currentUser = (User) session.getAttribute("user");
		try {
			body += "THÔNG TIN NGƯỜI NHẬN\n" ;
			body += "Họ và tên: "+ receiver.trim()+"\n";
			body += "Địa chỉ: "+ address.trim()+"\n";
			body += "Số điện thoại: "+ sdt.trim()+"\n";
			body += "\n===========================\n";
			
			body += "\nTHÔNG TIN HOÁ ĐƠN\n";
			for (int i =0; i < name.length;i++) {
				body += "Sản phẩm: " + name[i].trim() + ".\n\t Giá: " + price[i].trim() + "VNĐ.\n\t Số lượng: " + quantity[i].trim() + ".\n\t Khuyến mãi: " + discount[i] + "%.\n\t Thành tiền: " + total[i] + "VNĐ. \n";
				Orders order = new Orders();
				order.setUsernameid(currentUser);
				order.setId_product(id[i]);
				order.setAmount(Integer.valueOf(quantity[i]));
				order.setDiscount(Integer.valueOf(discount[i]));
				order.setTotal(Integer.valueOf(total[i]));
				Product p = (Product) session1.get(Product.class, id[i]);
				p.setQuantity(p.getQuantity() - Integer.valueOf(quantity[i]));
				Date date = new Date();
				order.setDate(date);
				session1.save(order);
			}
			
			body += ".\n===========================\n" + "\nTổng thanh toán của bạn là : " + total_amount;	
			
			
			MimeMessage mail = mailer.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mail);
			helper.setFrom(from, from);
			helper.setTo(to);
			helper.setReplyTo(from,from);
			helper.setSubject(subject);
			helper.setText(body);
			mailer.send(mail);
			model.addAttribute("message", "Đơn hàng của bạn đã thông báo đến email!");
			session.removeAttribute("Orders");
			session.removeAttribute("Orders_list");
			t.commit();
		} catch (Exception e) {
			model.addAttribute("message", "Có lỗi xảy ra!");
			t.rollback();
		}finally {
			session1.close();
		}
		return "/home/record";
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "addCart", method = RequestMethod.POST)
	public String cart_add(ModelMap model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		Session session2 = factory.getCurrentSession();
		Product p = (Product) session2.get(Product.class, id);
		
        Map<String,Product> orders = new HashMap<>();
        if (session.getAttribute("Orders") != null) {
            orders = ((Map) session.getAttribute("Orders"));
        }
        orders.put(p.getId(),p);
        ArrayList<Product> orders_list = new ArrayList<Product>(orders.values());
 		session.setAttribute("Orders_list", orders_list);
        session.setAttribute("Orders", orders);
        model.addAttribute("Oders_list", orders_list);
		model.addAttribute("message", "Bạn đã thêm sản phẩm vào giỏ hàng");
		return "home/cart";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="deleteCart", method = RequestMethod.POST)
	public String cart_delete(HttpServletRequest request, ModelMap model) {
		HttpSession session = request.getSession();
		Map<String,Product> orders = new HashMap<>();
 		if (session.getAttribute("Orders") != null) {
           	orders = (Map<String,Product>) session.getAttribute("Orders");
        }
 		String id = request.getParameter("deleteItem");
 		orders.remove(id);
 		session.setAttribute("Orders", orders);
 		ArrayList<Product> orders_list =  new ArrayList<Product>(orders.values());
 		session.setAttribute("Orders_list", orders_list);
 		model.addAttribute("Orders_list", orders_list);
		return "redirect:/home/cart.htm"; 
	}
	
	// Ma hoa Md5
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
	
	@SuppressWarnings("unchecked")
	@ModelAttribute("products")
	public List<Product> getProducts() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Product";
		Query query = session.createQuery(hql);
		List<Product> list = query.list();
		return list;
	}

	@SuppressWarnings("unchecked")
	@ModelAttribute("foods")
	public List<Product> getFoods() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Product P WHERE P.type= :type ";
		Query query = session.createQuery(hql);
		query.setParameter("type", "FOOD");
		List<Product> list = query.list();
		return list;
	}

	@SuppressWarnings("unchecked")
	@ModelAttribute("drinks")
	public List<Product> getDrinks() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Product P WHERE P.type= :type ";
		Query query = session.createQuery(hql);
		query.setParameter("type", "DRINK");
		List<Product> list = query.list();
		return list;
	}

	@RequestMapping("single/{id}")
	public String update_product(ModelMap model, @PathVariable("id") String id) {
		Session session = factory.getCurrentSession();
		Product product = (Product) session.get(Product.class, id);
		model.addAttribute("product", product);
		model.addAttribute("products", getProducts());
		return "/home/single";
	}
	// Random string
	static String getRandomPassword(int n) 
    { 
        String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                    + "0123456789"
                                    + "abcdefghijklmnopqrstuvxyz"; 
        StringBuilder sb = new StringBuilder(n); 
  
        for (int i = 0; i < n; i++) { 
            int index 
                = (int)(AlphaNumericString.length() 
                        * Math.random()); 
            sb.append(AlphaNumericString 
                          .charAt(index)); 
        } 
        return sb.toString(); 
    }
}
