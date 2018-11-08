import React from "react";
import { Link } from "react-router-dom";


// export class PokemonIndexItem extends Component {
//   render() {
//     const { pokemon } = this.props;
//     return (
//       <li key={pokemon.id}>
//         <img src={pokemon.image_url} height="50" width="50"></img>
//         {pokemon.name}
//       </li>
//     );
//   }
// }
// export PokemonIndexItem;

export const PokemonIndexItem = (props) => {
  return (
    <li key={props.pokemon.id}>
      <Link to={`/pokemon/${props.pokemon.id}`}>
        <img src={props.pokemon.image_url} height="50" width="50"></img>
        {props.pokemon.name}
      </Link>
    </li>
  );

};
