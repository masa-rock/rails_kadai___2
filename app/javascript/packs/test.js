let menulist = document.getElementById("account-menu");
// let display_btn = document.getElementsByClassName("profile-image")[0];

// display_btn.addEventListener("click",()=>{
//   menulist.classList.toggle("hide");
// });
$(function(){
  $(".profile-image").on('click',function(){
    $("#account-menu").toggleClass("hide");
    return false;
  });
});



