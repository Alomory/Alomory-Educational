var slideIndex = 0;
    showSlides();
    // setInterval( showSlides, 2000);
    function showSlides() {
      var i;
      var slides = document.getElementsByClassName("mySlides");
      var dots = document.getElementsByClassName("dots");
       
      for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
        
      }
      slideIndex++;
      if (slideIndex > slides.length) {
        slideIndex = 1;
      }

      for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
        
      }
      slides[slideIndex - 1].style.display = "block";
      dots[slideIndex - 1].className += " active";
      setTimeout(showSlides, 5000);
      
    }

// setTimeout(function() { showSlides() }, 2000);