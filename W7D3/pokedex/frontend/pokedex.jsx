import React from 'react';
import ReactDOM from 'react-dom';
import { receiveAllPokemon } from "./actions/pokemon_actions";
import { fetchAllPokemon } from "./util/api_util";
import configureStore from './store/store';


document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  window.store = store;
  const rootEl = document.getElementById('root');
  ReactDOM.render(<h1>Pokedex</h1>, rootEl);
});

window.receiveAllPokemon = receiveAllPokemon;
window.fetchAllPokemon = fetchAllPokemon;
window.getState = store.getState;
window.dispatch = store.dispatch;
