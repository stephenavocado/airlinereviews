import React, {useState, useEffect, Fragment} from 'react'
import axios from 'axios'
import Header from './Header'
import ReviewForm from './ReviewForm'
import Review from '../Review'
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

  const handleChange = (event) => {
    event.preventDefault()
    setReview(Object.assign({}, review, {[event.target.name]: event.target.value}))

    console.log('review:', review)
  }
  // handle changes to input fields
  // alt method: {...review, [e.target.name]: e.value}

  const handleSubmit = (event) => {
    event.preventDefault()

    const csrfToken = document.querySelector('[name=csrf-token]').content
    axios.defaults.headers.common['X-CSRF-TOKEN'] = csrfToken

    const airline_id = airline.data.id
    axios.post('/api/v1/reviews', {review, airline_id})
      .then(resp => {
        const included = [...airline.included, resp.data.data]
        console.log(included)
        setAirline({...airline, included})
        setReview({title: '', description: '', score: 0})
      })
      .catch(resp => {})
  }
  // sumbit to api

  const setRating = (score, event) => {
    event.preventDefault()
    
    setReview({...review, score})
  }

  let reviews
  if (loaded && airline.included) {
    reviews = airline.included.map( (item, index) => {
      console.log("mapping", item)
      return (
        <Review
          key={index}
          attributes={item.attributes}
        />
      )
    })
  }

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
            {reviews}
          </Main>
        </Column>
        <Column>
          <ReviewForm
            handleChange={handleChange}
            handleSubmit={handleSubmit}
            setRating={setRating}
            attributes={airline.data.attributes}
            review={review}
          />
        </Column>
        </Fragment>
      }
    </Wrapper>
  ) 
}

export default Airline
