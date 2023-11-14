import type { NextApiRequest, NextApiResponse } from 'next'
import  mysql from 'mysql'

const pool = mysql.createPool({
  host: '[DB_ENDPOINT]',
  port: [PORT_NUMBER],
  user: '[MASTER_USERNAME]',
  password: '[MASTER_PASSWORD]',
  database: '[DATABASE_NAME]',
  connectionLimit: 10, // Adjust as needed
});

type ResponseData = {
  message: string
}
 
export default function handler(
  req: NextApiRequest,
  res: NextApiResponse<ResponseData>
) {
  res.status(200).json({ message: 'Hello from Next.js!' })
}