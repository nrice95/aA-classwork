import React from 'react';
import { Provider } from 'react-redux';
import PokemonIndexContainer from "./pokemon/pokemon_index_container";
import { HashRouter, Route } from "react-router-dom";

const Root = ({ store }) => {
  return(
    <Provider store={store}>
      <HashRouter>
        <div>
        <Route exact path="/" component={PokemonIndexContainer} />
        <Route exact path="/pokemon/:pokemonId" component={PokemonIndexContainer} />
        </div>
      </HashRouter>
    </Provider>
  );
};

export default Root;