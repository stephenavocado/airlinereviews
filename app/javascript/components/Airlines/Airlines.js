import React, { useState, useEffect, Fragment } from 'react'
import axios from 'axios'

const Airlines = () => {
  const [airlines, setAirlines] = useState([])

  useEffect(() => {
    // Get airlines from api
    // update airlines in our state

    axios.get('/api/v1/airlines.json')
      .then( resp => {
        setAirlines(resp.data.data)
      })
      .catch( resp => console.log(resp) )
  }, [airlines.length])

  const list = airlines.map(item => {
    return (<li key={item.attributes.name}>{item.attributes.name}</li>)
  })
  
  return(
    <Fragment>
    <div>This is Airlines index</div>
    <ul>{list}</ul>
    </Fragment>
  )
}

export default Airlines
