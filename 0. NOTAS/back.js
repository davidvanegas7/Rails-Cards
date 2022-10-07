const { data } = require("jquery");

const cards = JSON.parse(document.querySelector(".game-content").dataset.cards);
const deck = JSON.parse(document.querySelector(".game-content").dataset.deck);
console.log(cards);
console.log(deck);

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

  const XHR = new XMLHttpRequest();

  // XHR.open("GET", `/decks/${deck.code}/game`, true);
  // XHR.open("POST", `/scores`, true);
  XHR.open("GET", `/scores/1/test`, true);
  XHR.setRequestHeader(
    "Content-Type",
    "application/json",
    "Accept",
    "application/json"
  );

  // let params = cards[position];
  let info = { user_id: 1, card_id: 1, sum_total: 5, plays: 0, prom: 0 };

  // console.log(JSON.stringify(params));
  // console.log(params);
  // XHR.send("@card=" + cards[position]);
  XHR.send(JSON.stringify(info));
  // XHR.send(JSON.stringify(params));
  XHR.onreadystatechange = function () {
    if (this.readyState == "4" && this.status == "200") {
      let result = this.responseText;
      console.log(result);
    }
  };
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
