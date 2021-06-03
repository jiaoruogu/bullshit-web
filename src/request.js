import axios from 'axios'
export const login = data => axios.post('/api/login', data)
export const search = () => axios.get('/api/search')
export const add = data => axios.post('/api/add', data)