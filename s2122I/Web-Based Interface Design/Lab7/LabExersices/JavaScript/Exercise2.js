var slideIndex = 0;
    showSlides();
    // setInterval( showSlides, 2000);
    function showSlides() {
      var i;
      var slides = document.getElementsByClassName("mySlides");
      var dots = document.getElementsByClassName("dots");
        console.log("the size of the dots is"+ dots.length)
      for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
        console.log("in slides loop");
      }
      slideIndex++;
      if (slideIndex > slides.length) {
        slideIndex = 1;
      }

      for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
        console.log("in dots loop");
      }
      slides[slideIndex - 1].style.display = "block";
      dots[slideIndex - 1].className += " active";
      setTimeout(showSlides, 2000);
      console.log("End of the function");
    }


