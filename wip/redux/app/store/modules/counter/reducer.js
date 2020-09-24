export default function(state={cnt:0}, action) {

  switch(action.type)
  {
    case 'INCREMENT':
      return {
        ...state,
        cnt: state.cnt+=1
      }

    case 'DECREMENT':
      return {
        ...state,
        cnt: state.cnt-=1
      }

    default:
      return state
  }
}
