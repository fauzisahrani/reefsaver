/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
// Scroll to top
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

// variables
const searchBtn = document.getElementById("searchBtn");
const newsQuery = document.getElementById("newsQuery"); // to search news about cora
const newsType = document.getElementById("newsType");
const newsdetails = document.getElementById("newsdetails");

// Array
var newsDataArr = [];

// apis 
const API_KEY = "7cc1864f36844462928a26d336dba587";
const SEARCH_NEWS = "https://newsapi.org/v2/everything?q=coral"; //set query into coral

searchBtn.addEventListener("click", function () {
    fetchQueryNews();
});

const fetchQueryNews = async () => {

    if (newsQuery.value == null)
        return;

    const response = await fetch(SEARCH_NEWS + encodeURIComponent(newsQuery.value) + "&apiKey=" + API_KEY);
    newsDataArr = [];
    if (response.status >= 200 && response.status < 300) {
        const myJson = await response.json();
        newsDataArr = myJson.articles;
    } else {
        //error handle
        console.log(response.status, response.statusText);
        newsdetails.innerHTML = "<h5>No data found.</h5>"
        return;
    }

    displayNews();
}

function displayNews() {
    // Clear the news details container
    newsdetails.innerHTML = "";

    // Loop through each news item in the array
    newsDataArr.forEach((news) => {
        // Extract the date from the publishedAt string
        const [date] = news.publishedAt.split("T");

        // Create the HTML elements
        const col = document.createElement("div");
        col.className = "news-column";

        const card = document.createElement("div");
        card.className = "news-card";

        const image = document.createElement("img");
        image.src = news.urlToImage;
        image.className = "news-image";

        const cardBody = document.createElement("div");
        cardBody.className = "card-body";

        const newsHeading = document.createElement("h5");
        newsHeading.className = "news-heading";
        newsHeading.innerHTML = news.title;

        const dateHeading = document.createElement("h6");
        dateHeading.className = "date-heading";
        dateHeading.innerHTML = date;

        const description = document.createElement("p");
        description.className = "description";
        description.innerHTML = news.description;

        const link = document.createElement("a");
        link.className = "link";
        link.setAttribute("target", "_blank");
        link.href = news.url;
        link.innerHTML = "Read more";

        // Assemble the card body
        cardBody.appendChild(newsHeading);
        cardBody.appendChild(dateHeading);
        cardBody.appendChild(description);
        cardBody.appendChild(link);

        // Assemble the card
        card.appendChild(image);
        card.appendChild(cardBody);

        // Add the card to the column
        col.appendChild(card);

        // Add the column to the news details container
        newsdetails.appendChild(col);
    });
}



