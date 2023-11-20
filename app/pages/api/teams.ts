import type { NextApiRequest, NextApiResponse } from 'next'
import prisma from '../../lib/prisma'

/**
 * GET /api/teams
 * 
 * Get the teams in the Equipos table
 * 
 * @returns A list of teams as JSON
 */
export default async function handle(
  req: NextApiRequest,
  res: NextApiResponse,
) {
  const result = await prisma.equipos.findMany()
  return res.json(result)
}