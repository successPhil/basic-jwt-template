import axios from 'axios'

export default function Profile () {

    const fetchData = async () => {
        try {
          const response = await axios.get('http://localhost:8000/api/users/me/', {
            withCredentials: true, // Ensure that cookies are included in the request
          });
      
          // Handle the response data
          console.log(response.data);
        } catch (error) {
          // Handle errors
          console.error('Error fetching data:', error);
        }
      };
      
      // Call the function to fetch data
      fetchData();

      
    return (
        <h1 className="text-red-400">What a Profile Page</h1>
    )
}