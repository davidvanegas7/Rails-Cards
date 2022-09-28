const cards = JSON.parse(document.querySelector(".game-content").dataset.cards);
console.log(cards);

var question = document.getElementById("game-question");
var description = document.getElementById("game-answer");
var card_number = document.querySelectorAll(".game-cards");

var card = 1;
var position = 0;

window.onload = function () {
  question.textContent = cards[position].question;
  description.textContent = cards[position].description;
  card_number.forEach((number) => {
    number.textContent = card + "/" + cards.length;
  });
};

// ------------------------------------------------------------------------------------------------------------------------

const flip = document.getElementById("flip-card-button");
const set_score = document.getElementById("set-score");
const front = document.getElementById("game-front");
const back = document.getElementById("game-back");

flip.addEventListener("click", () => {
  flip.style.display = "none";
  set_score.style.display = "block";
  front.style.transform = "rotateY(180deg)";
  back.style.transform = "rotateY(360deg)";
});

// ------------------------------------------------------------------------------------------------------------------------

const scores = document.querySelectorAll(".points");
const next = document.querySelector(".next-card");

var select = false;
console.log(select);

scores.forEach((score) => {
  score.addEventListener("click", (e) => {
    if (!select) {
      next.style.display = "block";
      select = true;
    } else {
      alert("Ya puntuaste!!");
    }
  });
});

next.addEventListener("click", () => {
  if (position < cards.length - 1) {
    console.log(position);
    position++;
  } else {
    console.log(position);
    alert("Aca va a ir la renderizacion de la puntuacion");
    // console.log("llegaste al final" + cards.length);
  }
});
