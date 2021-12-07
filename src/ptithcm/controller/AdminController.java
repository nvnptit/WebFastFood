package ptithcm.controller;

import java.io.File;
import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
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

import jdk.nashorn.internal.ir.RuntimeNode.Request;
import ptit.bean.UploadFile;
import ptithcm.entity.User;
import ptithcm.entity.Product;
import ptithcm.entity.Slide;
import ptithcm.entity.Order;

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
	@Autowired
	@Qualifier("uploadfile")
	UploadFile baseUploadFile;

	// Login
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login_admin(ModelMap model) {
		return "admin/login";
	}

	// Logout
	@RequestMapping(value = "logout")
	public String logout_user(HttpServletResponse response, HttpServletRequest resquest) throws IOException {
		Cookie ck = new Cookie("authadmin", null);
		ck.setMaxAge(0);
		resquest.getSession().removeAttribute("user1");
		response.addCookie(ck);
		response.sendRedirect("/WebFastFood/admin/login.htm");
		return "admin/login";
	}

	// Index_GET
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String index_amdin(ModelMap model) {
		int sUsers = this.getUsers().size();
		int sProducts = this.getProducts().size();
		int sOrders = this.getOrders().size();
		model.addAttribute("sUsers", sUsers);
		model.addAttribute("sProducts", sProducts);
		model.addAttribute("sOrders", sOrders);

		double money = 0.0;
		List<Order> list = this.getOrders();
		for (Order o : list) {
			money += o.getTotal();
		}
		model.addAttribute("money", money);
		return "admin/index";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "index", method = RequestMethod.POST)
	public String login_admin(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		password = md5(password);

		HttpSession session = request.getSession();
		// Kiá»ƒm tra captcha
		String captcha = session.getAttribute("captcha_security").toString();
		String verifyC = request.getParameter("captcha");

		if (!captcha.equals(verifyC)) {
			model.addAttribute("recaptcha", "Vui lÃ²ng nháº­p Ä‘Ãºng captcha");
			return "admin/login";
		}

		Session session1 = factory.getCurrentSession();
		String hql = "FROM User WHERE role = :admin AND username= :username";
		Query query = session1.createQuery(hql);
		query.setParameter("admin", "admin");
		query.setParameter("username", username);
		List<User> list = query.list();

		if (list.size() > 0) {
			User currentUser = list.get(0);
			if (password.equals(currentUser.getPassword().trim())) {
				if (!currentUser.isStatus()) {
					model.addAttribute("message", "TÃ i khoáº£n cá»§a báº¡n Ä‘Ã£ bá»‹ vÃ´ hiá»‡u hoÃ¡!");
					return "admin/login";
				}

				session.setAttribute("user1", currentUser);
				session.setAttribute("role1", currentUser.getRole());

				Cookie ck = new Cookie("authadmin", md5(username));
				ck.setMaxAge(600);
				response.addCookie(ck);
				response.sendRedirect("index.htm");
			} else {
				model.addAttribute("message", "TÃªn Ä‘Äƒng nháº­p hoáº·c máº­t kháº©u khÃ´ng Ä‘Ãºng!");
				return "admin/login";
			}
		} else {
			model.addAttribute("message", "TÃªn Ä‘Äƒng nháº­p hoáº·c máº­t kháº©u khÃ´ng Ä‘Ãºng!");
			return "admin/login";
		}
		return "admin/login";
	}

	@RequestMapping(value = "forgot", method = RequestMethod.GET)
	public String forgot_admin() {
		return "admin/forgotpassword";
	}

	@RequestMapping(value = "forgot", method = RequestMethod.POST)
	public String forgot_post(HttpServletRequest request, ModelMap model) {
		String username = request.getParameter("username");

		Session session2 = factory.openSession();
		Transaction t = session2.beginTransaction();
		String hql = "FROM User WHERE role = :admin AND username= :username";
		Query query = session2.createQuery(hql);
		query.setParameter("admin", "admin");
		query.setParameter("username", username);
		List<User> list = query.list();

		if (list.size() > 0) {
			User currentUser = list.get(0);
			try {
				String email = currentUser.getEmail();
				String randomPass = getRandomPassword(10);
				String mahoa = md5(randomPass);
				String from = "codervn77@gmail.com";
				String to = email;
				String subject = "[KHÃ”I PHá»¤C Máº¬T KHáº¨U FASTFOOD]";
				String body = "Máº­t kháº©u cá»§a báº¡n : " + randomPass;
				currentUser.setPassword(mahoa);
				session2.update(currentUser);

				MimeMessage mail = mailer.createMimeMessage();

				MimeMessageHelper helper = new MimeMessageHelper(mail);
				helper.setFrom(from, from);
				helper.setTo(to);
				helper.setReplyTo(from, from);
				helper.setSubject(subject);
				helper.setText(body);
				mailer.send(mail);

				t.commit();
				model.addAttribute("message", "Máº­t kháº©u Ä‘Æ°á»£c gá»­i tá»›i mail cá»§a báº¡n!");
			} catch (Exception e) {
				t.rollback();
				model.addAttribute("message", "Gá»­i mail tháº¥t báº¡i, hÃ£y gá»­i láº¡i!");
			} finally {
				session2.close();
			}
		} else {
			model.addAttribute("message", "TÃ i khoáº£n khÃ´ng tá»“n táº¡i!");
		}
		return "admin/forgotpassword";
	}

	@RequestMapping(value = "user", method = RequestMethod.GET)
	public String table_user(ModelMap model) {
		model.addAttribute("users", getUsers());
		return "admin/user";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "product", method = RequestMethod.GET)
	public String page_product(HttpServletRequest request, ModelMap model, @ModelAttribute("product") Product product) {
		List<Product> products = this.getProducts();
		PagedListHolder pagedListHolder = new PagedListHolder(products);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(50);
		pagedListHolder.setPageSize(5);
		model.addAttribute("pagedListHolder", pagedListHolder);
		return "admin/product";
	}

	@RequestMapping(value = "delete/user/{username}", method = RequestMethod.GET)
	public String delete(HttpServletRequest request, HttpServletResponse response, ModelMap model,
			@PathVariable("username") String username) throws IOException {

		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		User user = (User) session.get(User.class, username);

		Session session1 = factory.getCurrentSession();
		String hql = "FROM Order od WHERE od.usernameid.username = :username";
		Query query = session1.createQuery(hql);
		query.setParameter("username", username);
		List<User> list = query.list();
		try {
			HttpSession httpSession = request.getSession();
			User user1 = (User) httpSession.getAttribute("user1");
			if (user1.getUsername().equals(user.getUsername())) {
				model.addAttribute("message", "Báº¡n khÃ´ng thá»ƒ tá»± xoÃ¡ chÃ­nh mÃ¬nh");
				return "admin/user";
			} else if (list.size() > 0) {
				user.setStatus(false);
				System.out.println(user.getFullname() + " | " + user.isStatus());
				session.update(user);
				model.addAttribute("message", "Ä�Ã£ huá»· kÃ­ch hoáº¡t vÃ¬ Ä‘Ã£ tá»“n táº¡i trong hoÃ¡ Ä‘Æ¡n!");
				t.commit();
				return "admin/user";
			} else {
				session.delete(user);
				t.commit();
				model.addAttribute("message", "XoÃ¡ thÃ nh cÃ´ng");
			}
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "XoÃ¡ tháº¥t báº¡i");
		} finally {
			model.addAttribute("users", getUsers());
			session.close();
		}
		return "admin/user";
	}

	@RequestMapping(value = "delete/product/{id}", method = RequestMethod.GET)
	public String delete_product(ModelMap model, @PathVariable("id") int id) {

		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		Product product = (Product) session.get(Product.class, id);
		Session session1 = factory.getCurrentSession();
		String hql = "FROM Order od WHERE od.id_product.id = :id";
		Query query = session1.createQuery(hql);
		query.setParameter("id", id);
		List<Product> list = query.list();

		try {
			if (list.size() > 0) {
				product.setStatus(false);
				session.update(product);
				model.addAttribute("message", "Ä�Ã£ huá»· kÃ­ch hoáº¡t vÃ¬ Ä‘Ã£ tá»“n táº¡i trong hoÃ¡ Ä‘Æ¡n!");
				t.commit();
				// return "admin/product";
				return "redirect:/admin/product.htm";
			} else {
				session.delete(product);
				model.addAttribute("message", "XoÃ¡ sáº£n pháº©m thÃ nh cÃ´ng! ");
			}
			t.commit();
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "XoÃ¡ sáº£n pháº©m tháº¥t báº¡i! ");
		} finally {

			model.addAttribute("products", getProducts());
			session.close();
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

	@SuppressWarnings("unchecked")
	@ModelAttribute("orders")
	public List<Order> getOrders() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Order";
		Query query = session.createQuery(hql);
		List<Order> list = query.list();
		return list;
	}

	@ModelAttribute("roles")
	public Map<String, String> getRoles() {
		Map<String, String> mj = new HashMap<>();
		mj.put("USER", "NgÆ°á»�i dÃ¹ng");
		mj.put("ADMIN", "Quáº£n trá»‹");
		return mj;
	}

	@ModelAttribute("typeProducts")
	public Map<String, String> getTypeProducts() {
		Map<String, String> mj = new HashMap<>();
		mj.put("Food", "Thá»©c Äƒn");
		mj.put("Drink", "Thá»©c uá»‘ng");
		return mj;
	}

	@RequestMapping(value = "changepassword", method = RequestMethod.GET)
	public String changepassword() {
		return "admin/changepassword";
	}

	@RequestMapping(value = "changepassword", method = RequestMethod.POST)
	public String changepassword(HttpServletRequest request, ModelMap model) {
		String oldpass = request.getParameter("oldpass");
		String newpass = request.getParameter("newpass");
		String confirmpass = request.getParameter("confirmpass");

		HttpSession httpSession = request.getSession();

		User user = (User) httpSession.getAttribute("user1");
		String pass_md5 = md5(oldpass);
		if (!pass_md5.equals(user.getPassword())) {
			model.addAttribute("message", "Máº­t kháº©u cÅ© khÃ´ng Ä‘Ãºng!");
		} else {
			if (!newpass.equals(confirmpass)) {
				model.addAttribute("message", "Máº­t kháº©u xÃ¡c nháº­n khÃ´ng trÃ¹ng vá»›i máº­t kháº©u má»›i!");
			} else {
				Session session2 = factory.openSession();
				Transaction t = session2.beginTransaction();
				user.setPassword(md5(newpass));
				try {
					session2.update(user);
					t.commit();
					model.addAttribute("message", "Thay máº­t kháº©u thÃ nh cÃ´ng!");
				} catch (Exception e) {
					t.rollback();
					model.addAttribute("message", "Thay máº­t kháº©u tháº¥t báº¡i!");
				} finally {
					session2.close();
				}
			}
		}

		return "admin/changepassword";
	}

	@RequestMapping(value = "form_user", method = RequestMethod.GET)
	public String form_user(ModelMap model) {
		model.addAttribute("user", new User());
		return "admin/form_user";
	}

	@RequestMapping(value = "form_product", method = RequestMethod.GET)
	public String form_product(ModelMap model) {
		model.addAttribute("product", new Product());
		return "admin/form_product";
	}

	@RequestMapping("form_user/{username}")
	public String update(ModelMap model, @PathVariable("username") String username) {
		Session session = factory.getCurrentSession();
		User user = (User) session.get(User.class, username);
		model.addAttribute("user", user);
		return "admin/user_update";
	}

	@RequestMapping(value = "product_update/{id}", method = RequestMethod.GET)
	public String update_product(ModelMap model, @PathVariable("id") int id) {
		Session session = factory.getCurrentSession();
		Product product = (Product) session.get(Product.class, id);
		model.addAttribute("product", product);
		return "admin/product_update";
	}

	@RequestMapping(value = "form_user/update", method = RequestMethod.POST)
	public String update(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		String username = request.getParameter("username");
		String fullname = request.getParameter("fullname");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String role = request.getParameter("role");
		boolean status = Boolean.valueOf(request.getParameter("status"));
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		User user = (User) session.get(User.class, username);
		user.setFullname(chuanHoa(fullname));
		user.setEmail(email);
		if (!phone.matches("\\d{10}")) {
			model.addAttribute("user", user);
			model.addAttribute("message", "Sá»‘ Ä‘iá»‡n thoáº¡i pháº£i gá»“m 10 sá»‘");
			return "admin/user_update";
		} else {
			user.setPhone(phone);
		}
		user.setRole(role);
		user.setStatus(status);
		try {

			HttpSession ss = request.getSession();
			User current = (User) ss.getAttribute("user1");
			if (user.getUsername().equals(current.getUsername())) {
				if (!user.isStatus()) {
					model.addAttribute("message", "KhÃ´ng thá»ƒ tá»± khoÃ¡ tÃ i khoáº£n");
					return "admin/user";
				}
				ss.setAttribute("user1", user);
			}
			session.update(user);
			t.commit();
			model.addAttribute("message", "Cáº­p nháº­t ngÆ°á»�i dÃ¹ng thÃ nh cÃ´ng");
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Cáº­p nháº­t ngÆ°á»�i dÃ¹ng tháº¥t báº¡i");
		} finally {
			model.addAttribute("users", getUsers());
			session.close();
		}
		return "admin/user";
	}

	@RequestMapping(value = "form_user/insert", method = RequestMethod.POST)
	public String insert_admin(ModelMap model, @ModelAttribute("user") User user) {

		Session session1 = factory.getCurrentSession(); // Get session hiá»‡n táº¡i
		String hql = "FROM User WHERE username = :username";
		Query query = session1.createQuery(hql).setParameter("username", user.getUsername());
		@SuppressWarnings("unchecked")
		List<User> list = query.list();

		if (list.size() > 0) {
			model.addAttribute("message", "Username Ä‘Ã£ tá»“n táº¡i, má»�i báº¡n Ä‘Äƒng kÃ­ tÃ i khoáº£n khÃ¡c!");
			return "admin/form_user";
		}
		if (!user.getPhone().matches("\\d{10}")) {
			model.addAttribute("message", "Sá»‘ Ä‘iá»‡n thoáº¡i pháº£i gá»“m 10 sá»‘");
			return "admin/form_user";
		}
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		user.setFullname(chuanHoa(user.getFullname()));
		try {
			String randomPass = getRandomPassword(10);
			String mahoa = md5(randomPass);
			String from = "codervn77@gmail.com";
			String to = user.getEmail();
			String subject = "YOUR PASSWORD";
			String body = "Máº­t kháº©u cá»§a báº¡n : " + randomPass;

			MimeMessage mail = mailer.createMimeMessage();

			MimeMessageHelper helper = new MimeMessageHelper(mail);
			helper.setFrom(from, from);
			helper.setTo(to);
			helper.setReplyTo(from, from);
			helper.setSubject(subject);
			helper.setText(body);

			mailer.send(mail);
			user.setPassword(mahoa);
			session.save(user);
			t.commit();
			model.addAttribute("message", "ThÃªm má»›i thÃ nh cÃ´ng, máº­t kháº©u cá»§a báº¡n Ä‘Ã£ gá»­i Ä‘áº¿n mail!");
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "ThÃªm má»›i tháº¥t báº¡i!");
		} finally {
			session.close();
		}
		return "admin/form_user";
	}

	@RequestMapping(value = "form_product/insert", method = RequestMethod.POST)
	public String insert_product(ModelMap model, @ModelAttribute("product") Product product,
			@RequestParam("file") MultipartFile file) {

		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		product.setName(chuanHoa(product.getName()));

		Session session1 = factory.getCurrentSession();
		String hql = "FROM Product WHERE name = :name AND type = :type";
		Query query = session1.createQuery(hql);
		query.setParameter("name", product.getName());
		query.setParameter("type", product.getType());
		List<Product> list = query.list();

		if (list.size() > 0) {
			Product pro = (Product) list.get(0);
			model.addAttribute("product", pro);
			model.addAttribute("message", "Ä�Ã£ tá»“n táº¡i tÃªn sáº£n pháº©m nÃ y trong há»‡ thá»‘ng!");
			return "admin/product_update";
		}

		if (file.isEmpty()) {
			model.addAttribute("message", "Vui lÃ²ng chá»�n file!");
		} else {
			try {
				String name = System.currentTimeMillis() + "-" + file.getOriginalFilename();
				String photoPath = "D:\\workspace\\WebFastFood\\WebContent\\resources\\images\\products\\" + name;
				file.transferTo(new File(photoPath));
				product.setImg(name);
				session.save(product);
				t.commit();
				model.addAttribute("message", "ThÃªm má»›i thÃ nh cÃ´ng!");
			} catch (Exception e) {
				t.rollback();
				model.addAttribute("message", "ThÃªm má»›i tháº¥t báº¡i!");
			} finally {
				session.close();
			}
		}
		return "admin/product_update";
	}

	@RequestMapping(value = "product_update/{id}", method = RequestMethod.POST)
	public String update_product(ModelMap model, @ModelAttribute("product") Product product,
			@RequestParam("file") MultipartFile file, @PathVariable("id") int id) {
		Session session1 = factory.getCurrentSession();
		Product product1 = (Product) session1.get(Product.class, id);
		// láº¥y ra Ä‘á»ƒ tráº£ vá»� hÃ¬nh áº£nh cÅ© náº¿u khÃ´ng thay Ä‘á»•i

		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		String hql = "FROM Product WHERE name = :name AND type = :type";
		Query query = session1.createQuery(hql);
		query.setParameter("name", product.getName());
		query.setParameter("type", product.getType());
		List<Product> list = query.list();

		if (list.size() > 0) {
			model.addAttribute("message",
					"Ä�Ã£ tá»“n táº¡i tÃªn sáº£n pháº©m " + product.getName() + " nÃ y trong há»‡ thá»‘ng!");
			model.addAttribute("product", product1);
			return "admin/product_update";
		}

		try {
			product.setName(chuanHoa(product.getName()));
			if (!file.isEmpty()) {
				String name = System.currentTimeMillis() + "-" + file.getOriginalFilename();
				String photoPath = "D:\\workspace\\WebFastFood\\WebContent\\resources\\images\\products\\" + name;
				file.transferTo(new File(photoPath));
				product.setImg(name);
			} else {
				product.setImg(product1.getImg());
			}
			session.update(product);
			t.commit();
			model.addAttribute("message", "Cáº­p nháº­t sáº£n pháº©m thÃ nh cÃ´ng!");
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Cáº­p nháº­t sáº£n pháº©m tháº¥t báº¡i!");
		} finally {
			session.close();
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
			BigInteger bigInteger = new BigInteger(1, digest.digest());
			result = bigInteger.toString(16);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return result;
	}

	static String getRandomPassword(int n) {

		// chose a Character random from this String
		String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" + "0123456789" + "abcdefghijklmnopqrstuvxyz";

		// create StringBuffer size of AlphaNumericString
		StringBuilder sb = new StringBuilder(n);

		for (int i = 0; i < n; i++) {

			// generate a random number between
			// 0 to AlphaNumericString variable length
			int index = (int) (AlphaNumericString.length() * Math.random());

			// add Character one by one in end of sb
			sb.append(AlphaNumericString.charAt(index));
		}

		return sb.toString();
	}

	public String chuanHoa(String s) {
		s = s.trim();
		s = s.replaceAll("\\s+", " ");

		String a[] = s.split(" ");
		String kq = "";
		for (String x : a) {
			kq = kq + x.substring(0, 1).toUpperCase() + x.substring(1).toLowerCase();
			kq += " ";
		}
		kq = kq.trim();
		return kq;
	}

	// -------------------------------------------- Trình chiếu --------------------------------------------

	@SuppressWarnings("unchecked")
	@ModelAttribute("slides")
	public List<Slide> getSlides() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Slide";
		Query query = session.createQuery(hql);
		List<Slide> list = query.list();
		return list;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "slide", method = RequestMethod.GET)
	public String page_slide(HttpServletRequest request, ModelMap model, @ModelAttribute("slide") Slide slide) {
		List<Slide> slides = this.getSlides();
		PagedListHolder pagedListHolder = new PagedListHolder(slides);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(50);
		pagedListHolder.setPageSize(10);
		model.addAttribute("pagedListHolder", pagedListHolder);
		return "admin/slide";
	}

	@RequestMapping(value = "form_slide", method = RequestMethod.GET)
	public String form_slide(ModelMap model) {
		model.addAttribute("slide", new Slide());
		return "admin/form_slide";
	}

	@RequestMapping(value = "form_slide/insert", method = RequestMethod.POST)
	public String insert_slide(ModelMap model, @ModelAttribute("slide") Slide slide,
			@RequestParam("file") MultipartFile file) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		if (file.isEmpty()) {
			model.addAttribute("message", "Hãy chọn file ảnh để trình chiếu!");
		} else {
			try {
				String date = LocalDateTime.now().format(DateTimeFormatter.ofPattern("ddMMyyyyHHmmss-"));
				String fileName = date + file.getOriginalFilename();
				String photoPath = baseUploadFile.getBasePath() + fileName;
				file.transferTo(new File(photoPath));
				slide.setImg(fileName);
				session.save(slide);
				t.commit();
				model.addAttribute("message", "Thêm trình chiếu mới thành công!");
			} catch (Exception e) {
				t.rollback();
				e.printStackTrace();
				model.addAttribute("message", "Thêm trình chiếu mới thất bại!");
			} finally {
				session.close();
			}
		}
		return "admin/slide_update";
	}

	@RequestMapping(value = "slide_update/{id}", method = RequestMethod.GET)
	public String update_slide(ModelMap model, @PathVariable("id") int id) {
		Session session = factory.getCurrentSession();
		Slide slide = (Slide) session.get(Slide.class, id);
		model.addAttribute("slide", slide);
		return "admin/slide_update";
	}

	@RequestMapping(value = "slide_update/{id}", method = RequestMethod.POST)
	public String update_slide(ModelMap model, @ModelAttribute("slide") Slide slide,
			@RequestParam("file") MultipartFile file, @PathVariable("id") int id) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		if (file.isEmpty()) {
			model.addAttribute("message", "Hãy chọn file ảnh để trình chiếu!");
		} else {
			try {
				String date = LocalDateTime.now().format(DateTimeFormatter.ofPattern("ddMMyyyyHHmmss-"));
				String fileName = date + file.getOriginalFilename();
				String photoPath = baseUploadFile.getBasePath() + fileName;
				file.transferTo(new File(photoPath));
				slide.setImg(fileName);
				session.update(slide);
				t.commit();
				model.addAttribute("message", "Cập nhật trình chiếu thành công!");
			} catch (Exception e) {
				t.rollback();
				model.addAttribute("message", "Cập nhật trình chiếu thất bại!");
			} finally {
				session.close();
			}
		}
		
		return "admin/slide_update";
	}

	@RequestMapping(value = "delete/slide/{id}", method = RequestMethod.GET)
	public String delete_slide(ModelMap model, @PathVariable("id") int id) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		Slide slide = (Slide) session.get(Slide.class, id);
		Session session1 = factory.getCurrentSession();
		String hql = "FROM Slide WHERE id = :id";
		Query query = session1.createQuery(hql);
		query.setParameter("id", id);
		List<Slide> list = query.list();

		try {
			session.delete(slide);
			model.addAttribute("message", "Xóa trình chiếu thành công!");
			t.commit();
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Xóa trình chiếu thất bại!");
		} finally {
			model.addAttribute("slides", getSlides());
			session.close();
		}
		return "redirect:/admin/slide.htm";
	}

}
