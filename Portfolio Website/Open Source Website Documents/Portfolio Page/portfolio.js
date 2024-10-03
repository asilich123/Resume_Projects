
// Manipulating movement of track itself
const track = document.getElementById("image-track");

const handleOnDown = e => track.dataset.mouseDownAt = e.clientX;

const handleOnUp = () => {
  track.dataset.mouseDownAt = "0";  
  track.dataset.prevPercentage = track.dataset.percentage;
}

const handleOnMove = e => {
  if(track.dataset.mouseDownAt === "0") return;
  
  const mouseDelta = parseFloat(track.dataset.mouseDownAt) - e.clientX,
        maxDelta = window.innerWidth / 2;
  
  const percentage = (mouseDelta / maxDelta) * -100,
        nextPercentageUnconstrained = parseFloat(track.dataset.prevPercentage) + percentage,
        nextPercentage = Math.max(Math.min(nextPercentageUnconstrained, 0), -100);
  
  track.dataset.percentage = nextPercentage;
  

// Manipulate the Cards themselves during track movement
  track.animate({
    transform: `translate(${nextPercentage}%, -50%)`
  }, { duration: 1200, fill: "forwards" });
  // 80 is start position of track image on move
  for(const image of track.getElementsByClassName("image")) {
    image.animate({
      objectPosition: `${80 + nextPercentage}% center`
    }, { duration: 1200, fill: "forwards" });
  }
}



// Placeholder Redirection Code for Unusued Portfolio Cards
for(const image of track.getElementsByClassName("image")) {
  image.onclick = function() {
    window.location.href = 'http://www.google.com/';
};
}

// Redirection Code for Portfolio Cards by Id

document.getElementById("timeSeries").onclick = function() {
  window.location.href = 'https://adriansilich.com/Portfolio%20Projects/CM%20Rev%20Pred/timeseries.html';
};
document.getElementById("neuralNetwork").onclick = function() {
  window.location.href = 'https://adriansilich.com/Portfolio%20Projects/Neural%20Network/neuralnetwork.html';
};
document.getElementById("dealX").onclick = function() {
  window.location.href = 'https://adriansilich.com/Portfolio%20Projects/DealX/dealx.html';
};
document.getElementById("scraper").onclick = function() {
  window.location.href = 'https://adriansilich.com/Portfolio%20Projects/Web%20Scraper/scraper.html';
};
document.getElementById("apiScraper").onclick = function() {
  window.location.href = 'https://adriansilich.com/Portfolio%20Projects/API%20Scraper/apiscraper.html';
};
document.getElementById("styleTransfer").onclick = function() {
  window.location.href = 'https://adriansilich.com/Portfolio%20Projects/Style%20Transfer/transfer.html';
};
document.getElementById("website").onclick = function() {
  window.location.href = 'https://adriansilich.com/Portfolio%20Projects/Website/website.html';
};

// Establish Help Icons
let Help1 = document.getElementById('ClickHelp')
let Help2 = document.getElementById('DragHelp')
let Help3 = document.getElementById('DragText')

// Show Help Icons After 1 & 2 Seconds
function DisplayHelp1() {
  Help1.style.visibility = "visible";
}
setTimeout("DisplayHelp1()", 1000); 
function DisplayHelp2() {
  Help2.style.visibility = "visible";
}
setTimeout("DisplayHelp2()", 2000); 
function DisplayHelp3() {
  Help3.style.visibility = "visible";
}
setTimeout("DisplayHelp3()", 2000); 

// Remove Help Icons Upon Mousedown
window.addEventListener("mousedown", (e) => {
  Help1.remove();
  Help2.remove();
  Help3.remove();
});





window.onmousedown = e => handleOnDown(e);

window.ontouchstart = e => handleOnDown(e.touches[0]);

window.onmouseup = e => handleOnUp(e);

window.ontouchend = e => handleOnUp(e.touches[0]);

window.onmousemove = e => handleOnMove(e);

window.ontouchmove = e => handleOnMove(e.touches[0]);

