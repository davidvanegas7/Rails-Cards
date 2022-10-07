const { data } = require("jquery");

var deck_code = $(".game-content").data("deck");
var question = $("#game-question");
var answer = $("#game-answer");
var card_number = $(".game-cards");

var cards;
var current_card = 1;
var score;

(function (window, undefined) {
  $.ajax({
    url: "/get_cards",
    type: "get",
    async: false,
    data: { deck_code: deck_code },
  }).done(function (data) {
    cards = data;
  });

  question.text(`${cards[current_card - 1].question}`);
  answer.text(`${cards[current_card - 1].description}`);
  card_number.text(`${current_card} / ${cards.length}`);
})(window);

$(".view-game").on("click", ".flip-card", showBack);

$(".view-game").on("click", ".points", function () {
  $(".points").prop("disabled", true);
  let points = this.value;
  score = getScore(cards[current_card - 1].id);

  plays = score.plays + 1;
  sum_total = calcSuma(points, score.sum_total);
  prom = calcProm(sum_total, plays);

  $.ajax({
    url: `/scores/${score.id}`,
    type: "patch",
    data: {
      score_id: score.id,
      score: {
        sum_total: sum_total,
        plays: plays,
        prom: prom,
      },
    },
  }).done(function (data) {
    console.log("Saved!");
  });

  $(".next-card").show();
});

$(".view-game").on("click", ".next-card", function () {
  $(".points").prop("disabled", false);
  if (current_card < cards.length) {
    current_card += 1;

    question.text(`${cards[current_card - 1].question}`);
    answer.text(`${cards[current_card - 1].description}`);
    card_number.text(`${current_card} / ${cards.length}`);

    reset();
  } else {
    alert("Cartas terminadas!!");
    window.location.href = `http://localhost:3000/decks/${deck_code}`;
  }
});

function showBack() {
  $("#flip-card-button").hide();
  $("#set-score").show();
  $("#game-front").css("transform", "rotateY(180deg)");
  $("#game-back").css("transform", "rotateY(360deg)");
}

function reset() {
  $("#flip-card-button").show();
  $("#set-score").hide();
  $(".next-card").hide();
  $("#game-front").css("transform", "rotateY(0deg)");
  $("#game-back").css("transform", "rotateY(180deg)");
}

function getScore(card_id) {
  var result;
  $.ajax({
    url: "/get_score",
    type: "get",
    async: false,
    data: { card_id: card_id },
  }).done(function (data) {
    result = data;
  });
  return result;
}

function calcSuma(points, sum_total) {
  var res;
  res = points + sum_total;
  return res;
}

function calcProm(sum_total, plays) {
  var res;
  res = sum_total / plays;
  return res;
}
