export const fetchAllPokemon = () => {
  return $.ajax({
    method: 'GET',
    url: '/api/pokemon'
  });
};

export const fetchPokemon = (id) => {
  return $.ajax({
    method: "GET",
    url: `/api/pokemon/${id}`,
  });
};

// export const fetchAllItems = (items) => {
//   return $.ajax({
//     method: 'GET',
//     url: '/api/pokemon',
//     data: { items }
//   });
// };
