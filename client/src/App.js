import React, { Component } from 'react'
import { Container, Header, Segment, Button, Icon, Dimmer, Loader, Divider } from 'semantic-ui-react'

class App extends Component {
  constructor () {
    super()
    this.state = {}
    this.getSessions = this.getSessions.bind(this)
    this.getSession = this.getSession.bind(this)
  }

  componentDidMount () {
    this.getSessions()
  }

  fetch (endpoint) {
    return window.fetch(endpoint)
      .then(response => response.json())
      .catch(error => console.log(error))
  }

  getSessions () {
    this.fetch('/api/sessions')
      .then(sessions => {
        if (sessions.length) {
          this.setState({sessions: sessions})
          this.getSession(sessions[0].id)
        } else {
          this.setState({sessions: []})
        }
      })
  }

  getSession (id) {
    this.fetch(`/api/sessions/${id}`)
      .then(session => this.setState({session: session}))
  }

  render () {
    let {sessions, session} = this.state
    return sessions
      ? <Container text>
        <Header as='h2' icon textAlign='center' color='teal'>
          <Icon name='unordered list' circular />
          <Header.Content>
            List of Sessions
          </Header.Content>
        </Header>
        <Divider hidden section />
        {sessions && sessions.length
          ? <Button.Group color='teal' fluid widths={sessions.length}>
            {Object.keys(sessions).map((key) => {
              return <Button active={session && session.id === sessions[key].id} fluid key={key} onClick={() => this.getSession(sessions[key].id)}>
                {sessions[key].title}
              </Button>
            })}
          </Button.Group>
          : <Container textAlign='center'>No sessions found.</Container>
        }
        <Divider section />
        {session &&
          <Container>
            <Header as='h2'>{session.title}</Header>
            <Header as='h3'>{session.track && <p>{session.track}</p>}</Header>
            {session.description && <p>{session.description}</p>}
            Speakers:
            {session.speakers &&
              <Segment.Group>
                {session.speakers.map((speaker, i) => <Segment key={i}>{speaker.name}</Segment>)}
              </Segment.Group>
            }
            {session.source && <Button basic size='tiny' color='teal' target="_blank" href={session.source}>Source</Button>}
          </Container>
        }
      </Container>
      : <Container text>
        <Dimmer active inverted>
          <Loader content='Loading' />
        </Dimmer>
      </Container>
  }
}

export default App
