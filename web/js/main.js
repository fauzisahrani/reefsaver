const nav = document.querySelector("nav")

window.addEventListener("scroll", () => {
    if (window.pageYOffset > 60) {
        nav.classList.add("scrolled");
    } else {
        nav.classList.remove("scrolled")
    }
})

const toTop = document.querySelector(".to-top");

window.addEventListener("scroll", () => {
    if (window.pageYOffset > 100) {
        toTop.classList.add("active");
    } else {
        toTop.classList.remove("active");
    }
})