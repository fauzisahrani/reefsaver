const nav = document.querySelector("nav")

window.addEventListener("scroll", () => {
    if (window.pageYOffset > 60) {
        nav.classList.add("scrolled");
    } else {
        nav.classList.remove("scrolled")
    }
})

function confirmNavigation(message) {
    return confirm(message);
}

//validate password
function validatePassword() {
    var password = document.getElementById("userPassword").value;
    var confirmPassword = document.getElementById("userConfirmPassword").value;

    // Check if passwords match
    if (password !== confirmPassword) {
        alert("Passwords do not match.");
        return false;
    }

    // Check password length
    if (password.length < 8) {
        alert("Password must be at least 8 characters long.");
        return false;
    }

    // Check for at least one uppercase letter
    if (!/[A-Z]/.test(password)) {
        alert("Password must contain at least one uppercase letter (A-Z).");
        return false;
    }

    // Check for at least one lowercase letter
    if (!/[a-z]/.test(password)) {
        alert("Password must contain at least one lowercase letter (a-z).");
        return false;
    }

    // Check for at least one digit
    if (!/\d/.test(password)) {
        alert("Password must contain at least one digit (0-9).");
        return false;
    }

    // Check for at least one special character
    if (!/[!@#$%^&*]/.test(password)) {
        alert("Password must contain at least one special character (!@#$%^&*).");
        return false;
    }

    // Password passed all checks
    return true;
}
