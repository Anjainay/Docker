const express = require('express');
const mongoose = require('mongoose');
const app = express();
const PORT = 3000;

mongoose.connect('mongodb://mongodb:27017/testdb', {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

const Item = mongoose.model('Item', { name: String });

app.use(express.json());

app.get('/api/items', async (req, res) => {
  const items = await Item.find();
  res.json(items);
});

app.post('/api/items', async (req, res) => {
  const newItem = new Item({ name: req.body.name });
  await newItem.save();
  res.status(201).json(newItem);
});

app.listen(PORT, () => {
  console.log(`Backend running on port ${PORT}`);
});

