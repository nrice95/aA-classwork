import React from 'react';
import ReactDOM from 'react-dom';
import { receiveAllPokemon, requestAllPokemon, receivePokemon } from "./actions/pokemon_actions";
import { fetchAllPokemon, fetchPokemon } from "./util/api_util";
import configureStore from './store/store';
import {selectAllPokemon} from './reducers/selectors';
// import {receiveAllItems} from './actions/items_actions';
import Root from "./components/root_component";



document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  const rootEl = document.getElementById('root');
  // debugger
  ReactDOM.render(<Root store={store}/>, rootEl);
});


window.receiveAllPokemon = receiveAllPokemon;
window.receivePokemon = receivePokemon;
window.fetchAllPokemon = fetchAllPokemon;
window.fetchPokemon = fetchPokemon;
window.requestAllPokemon = requestAllPokemon;
window.selectAllPokemon = selectAllPokemon;

// const getSuccess = items => console.log(receiveAllItems(items));
// fetchAllItems().then(getSuccess);
