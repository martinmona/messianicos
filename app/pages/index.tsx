import Head from 'next/head'
import Equipo from '../components/equipo'
import prisma from '../lib/prisma'
import type { Equipos } from '@prisma/client/index.d.ts'
import { AppContext } from 'next/app'

interface HomeProps {
  equipos: Equipos[]
}  

export default function Home({ equipos }: HomeProps) {
  return (
    <div>
      <Head>
        <title>Messianicos</title>
        <meta name="description" content="Una pagina hecha para fans de Leo Messi" />
        <link rel="icon" href="/favicon.ico" />
      </Head>

      <main className="p-10 mx-auto max-w-4xl">
        {equipos?.length > 0 && 
          <div className="grid md:grid-cols-3 sm:grid-cols-2 grid-cols-1 justify-items-center  gap-4">
            Los equipos son
            {equipos.map((equipo) => (
              <Equipo nombre={equipo.Nombre} key={equipo.Id} />
            ))}
          </div>
        }
      </main>

      <footer></footer>
    </div>
  )
}

export async function getStaticProps(context: AppContext) {
  const data = await prisma.equipos.findMany()

  return {
    props: { equipos: data },
  }
}