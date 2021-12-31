import React, {useState, useEffect, Fragment} from 'react'
import axios from 'axios'
import Header from './Header'
import ReviewForm from './ReviewForm'
import styled from 'styled-components'

const Wrapper = styled.div`
  margin-left: auto;
  margin-right: auto;
  display: grid;
  grid-template-columns: repeat(2, 1fr);
`
const Column = styled.div`
  background: #fff;
  height: 100vh;

  &:last-child {
    background: #000;
  }
`
const Main = styled.div`
  padding-left: 50px;
`

const Airline = (props) => {
  const [airline, setAirline] = useState({})
  const [review, setReview] = useState({})
  const [loaded, setLoaded] = useState(false)
  // checks that data was loaded from api request

  useEffect(() => {
    // api/v1/airlines/united-airlines
    // airlines/unites-airlines
    const slug = props.match.params.slug
    const url = `/api/v1/airlines/${slug}`

    axios.get(url)
      .then( resp => {
        setAirline(resp.data) 
        setLoaded(true)
      })
      .catch( resp => console.log(resp) )
  }, [])

  return(
    <Wrapper>
      { 
        loaded &&
        <Fragment>
        <Column>
          <Main> 
            <Header 
              attributes={airline.data.attributes}
              reviews={airline.included}
            />
            <div className='reviews'></div>
          </Main>
        </Column>
        <Column>
          <ReviewForm>[Review form here]</ReviewForm>
        </Column>
        </Fragment>
      }
    </Wrapper>
  ) 
}

export default Airline
