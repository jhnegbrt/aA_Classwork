import {RECEIVE_STEP, RECEIVE_STEPS, REMOVE_STEP} from '../actions/step_actions'

const stepsReducer = (state = {}, action) => {

  Object.freeze(state)
  let nextState = Object.assign({}, state)

  switch(action.type){

    case RECEIVE_STEP:
      nextState[action.step.id] = action.step;
      return nextState;
    case RECEIVE_STEPS:
      nextState = {};
      action.steps.forEach(step => {
        nextState[step.id] = step;
      })
      return nextState

    case REMOVE_STEP:
      delete nextState[action.id];
      return nextState;
    default:
      return state;
  }
    

}

export default stepsReducer