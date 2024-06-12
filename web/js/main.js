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

//pie chart
// Sample data for the pie chart
const data = [
    {label: 'Poor', value: 12, color: 'pink'},
    {label: 'Fair', value: 32, color: 'wheat'},
    {label: 'Good', value: 54, color: 'lightgreen'}
];

const canvas = document.getElementById('pieChart');
const ctx = canvas.getContext('2d');
const centerX = canvas.width / 2;
const centerY = canvas.height / 2;
const radius = Math.min(centerX, centerY) - 10; // 10 pixels padding from the canvas edge

let startAngle = 0;
data.forEach(item => {
    const sliceAngle = (2 * Math.PI * item.value) / 100;
    const labelAngle = startAngle + sliceAngle / 2;
    const labelX = centerX + (radius / 2) * Math.cos(labelAngle);
    const labelY = centerY + (radius / 2) * Math.sin(labelAngle);

    // Draw slice
    ctx.fillStyle = item.color;
    ctx.beginPath();
    ctx.moveTo(centerX, centerY);
    ctx.arc(centerX, centerY, radius, startAngle, startAngle + sliceAngle);
    ctx.closePath();
    ctx.fill();

    // Draw label
    ctx.fillStyle = 'black';
    ctx.font = '12px Arial';
    ctx.textAlign = 'center';
    ctx.fillText(item.label, labelX, labelY);

    startAngle += sliceAngle;
});

// Add legend
let legendHTML = '';
data.forEach(item => {
    legendHTML += `<div><span style="display:inline-block; width:10px; height:10px; background-color:${item.color}; margin-right:5px;"></span>${item.label}</div>`;
});
document.body.insertAdjacentHTML('beforeend', `<div style="text-align:center;">${legendHTML}</div>`);