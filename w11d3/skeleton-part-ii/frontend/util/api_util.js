export const fetchAllPokemon = () => {
  return $.ajax({
    method: "GET",
    url: "/api/pokemon"
  })
}

export const fetchPokemon = (pokemon) =>{
  return $.ajax({
    method: 'Get',
    url: `/api/pokemon/${pokemon.id}`
  })
}