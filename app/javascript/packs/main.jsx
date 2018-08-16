import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

class Main extends React.Component {
  constructor(props) {
    super(props);
  }

  render(){
    return '';
  }
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Main />,
    document.getElementsByTagName('main')[0],
  )
})
