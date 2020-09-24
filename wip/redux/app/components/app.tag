<app>

  <div class="app">
    <h3>Riot with Redux</h3>

    <p>
        { this.name }
    </p>

    <button onclick={ initialize }>
      Initial fetch
    </button>
    <label>{cnt}</label>
    <button onclick={ increment }>+</button>
    <button onclick={ decrement }>-</button>
    <br/>
    <label>{redCnt}</label>
    <button onclick={ redIncrement }>red +</button>
    <button onclick={ redDecrement }>red -</button>
  </div>

  <script>
    this.on('mount', () => {
      this.name = this.store.getState().sampleReducer.name
      this.cnt=45
      this.redCnt=this.store.getState().counterReducer.cnt
      this.update()
    })

    this.increment = (e) => {
      this.cnt+=1
      this.update()
    }

    this.decrement = (e) => {
      this.cnt-=1
      this.update()
    }

    this.redIncrement = (e) => {
      this.store.dispatch({
        type: 'INCREMENT',
      })
      console.log(this.store.getState().counterReducer)
      this.redCnt = this.store.getState().counterReducer.cnt
      this.update()
    }

    this.redDecrement = (e) => {
      this.store.dispatch({
        type: 'DECREMENT',
      })
      console.log(this.store.getState().counterReducer)
      this.redCnt = this.store.getState().counterReducer.cnt
      this.update()
    }

    this.initialize = (e) => {
      let action = {
        type: 'ACTION',
        payload: new Promise((t, c) => {
          setTimeout(() => {
            t()
          }, 1000)

        }) // use AJAX, Axios or other promise execute
      }

      this.store.dispatch(action).then(() => {
        console.log('Promise executed')
        this.name = this.store.getState().sampleReducer.name
        this.update()
      })
    }
  </script>
</app>
