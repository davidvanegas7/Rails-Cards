console.log("Hello Game");

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

var scores = document.querySelectorAll(".points");

scores.forEach((score) => {
  score.addEventListener("click", (e) => {
    console.log(score.value);
  });
});
