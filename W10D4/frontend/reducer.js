const initialState = {
  city: "Please Select", 
  jobs: []
};

const reducer = (state = initialState, action) => {
  Object.freeze(state);
  switch (action.type) {
    case ("SWITCH_LOCATION"): 
      const nextState = Object.assign({}, state);
      //this dups the state into nextState 
      nextState.city = action.city;
      nextState.jobs = action.jobs
      return nextState;
    default: 
      return state;
  }
};

window.reducer = reducer 
export default reducer;
