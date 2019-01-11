const faker = require('faker');
const format = require('date-fns/format');
const db = require('./index');

// ---------------------------- GENERATE DATA TO SEED ---------------------------- //
const generateName = () => `${faker.commerce.productAdjective()} ${faker.commerce.department()} ${faker.commerce.product()}`;

const generateRestaurantId = () => Math.floor(Math.random() * 100 + 1);

const generateDate = () => format(Date.parse(faker.date.future()), 'MMDDYY');

const generateTime = () => (Math.floor(Math.random() * (23 - 10) + 10) * 100)
  + (Math.floor(Math.random() * 2) * 30);

const generatePartySize = () => Math.floor(Math.random() * 19 + 1);

// ---------------------- SEED DATABASE WITH GENERATED DATA ---------------------- //
for (let i = 0; i < 99; i += 1) {
  db.addRestaurant(generateName());
}

for (let i = 0; i < 98; i += 1) {
  db.addReservation(generateRestaurantId(), generateDate(), generateTime(), generatePartySize(),
    () => { /* addReservation requires a callback to async res.end. Passing empty callback. */ });
}
