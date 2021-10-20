function hide() {
	var message = "${message_login}";
	  var x = document.getElementById("span_login");	
		if (message === "init") {
	    x.style.display = "block";
	  } else {
		  x.style.display = "none";
	  }
	};
hide();