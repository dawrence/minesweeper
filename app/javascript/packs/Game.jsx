import React, { useState, useEffect } from 'react'
import axios from 'axios';

function Game(props){
  const [game, setGame] = useState({});

  const useEffect = (e) => {
    axios.get('/api/v1/games/')
    .then((result) => {
      this.setState({ vehicles: result.data });
    })
    .catch((error) => {
        alert(error)
        this.setState({ vehicles: [], error: error });
      }
    )
  }

  else {
    return (
      <div>
        <table>
          <>
        </table>
        <p><strong> Clicks Per Day: </strong> { stats.clicks_per_day }</p>
        <p><strong> Browsers: </strong> { stats.browsers }</p>
        <p><strong> Platforms: </strong> { stats.platforms }</p>
      </div>
    );
  }
}

export default Stats;
