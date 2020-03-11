const events = JSON.parse(document.querySelector("div[data-events]").dataset.events)


const eventsContainer = document.querySelector("#eventsContainer");
const containerHeight = eventsContainer.offsetHeight;
const containerWidth = eventsContainer.offsetWidth;

const boxColumnsCount = 7;
const boxLinesCount = 5;
const boxWidth = containerWidth / boxColumnsCount;
const boxHeight = containerHeight / boxLinesCount;

const boxes = [];
for (let x = 0; x < boxColumnsCount; x++) {
  for (let y = 0; y < boxLinesCount; y++) {
    console.log(x, y);
    boxes.push({
      topLeftX: x * boxWidth,
      topLeftY: y * boxHeight,
      rotated: Math.random() > 0.7
    });
  }
}

const removeElFromArray = (array, el) => {
  const index = array.indexOf(el);
  if (index > -1) {
    array.splice(index, 1);
  }
};

events.forEach(event => {
  const box = boxes[Math.floor(Math.random() * boxes.length)];
  removeElFromArray(boxes, box);
  const eventLink = document.createElement("a");
  const eventBox = document.createElement("div");
  eventBox.appendChild(eventLink);
  if (box.rotated) eventLink.classList.add("rotated");
  eventBox.classList.add("event");
  eventBox.style.top = `${box.topLeftY}px`;
  eventBox.style.left = `${box.topLeftX}px`;
  eventBox.style.width = `${boxWidth}px`;
  eventBox.style.height = `${boxHeight}px`;
  eventLink.innerHTML = event.name;
  eventLink.href = event.link;
  eventsContainer.appendChild(eventBox);
});


