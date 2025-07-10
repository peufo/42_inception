<script lang="ts">
    import Header from '$lib/Header.svelte';
    import { FileCode } from 'lucide-svelte';
</script>

<div class="flex flex-col gap-12 py-10 mx-1">
    <Header />

    <div class="hero">
        <div
            class="hero-content w-full bg-base-200/50 flex-col sm:flex-row items-center rounded-2xl"
        >
            <img
                src="/peufo/jvoisard.jpg"
                class="max-w-36 rounded-lg shadow-2xl"
                alt="Portrait de Jonas Voisard"
            />
            <div class="grow prose">
                <h1 class="text-3xl font-bold">Jonas Voisard</h1>
                <p>
                    Développeur full-stack passioné depuis 2014, je propose des
                    solutions simples à des problème concrets.
                </p>
            </div>
        </div>
    </div>

    <section class="prose flex gap-4 items-center">
        <p>
            J'ai évité des dizaines de milliers de rebuts sur des lignes
            d'assemblage complexes grâce à la mise en place de boucles de
            rétroactions automatiques.
        </p>

        <img
            src="/peufo/module.avif"
            alt="Module d'échapement"
            class="h-36 mt-0 mx-2"
        />
    </section>

    <section class="prose flex gap-4 items-center">
        <div class="stats shadow shrink-0">
            <div class="stat">
                <div class="stat-figure">
                    <FileCode />
                </div>
                <div class="stat-title">Fichiers obsolètes</div>
                <div class="stat-value">64 200</div>
                <div class="stat-desc">↘︎ 98.7%</div>
            </div>
        </div>

        J'ai développé un outil de gestion, de compilation et d'exécution des
        programmes MicroVu, permettant de réduire leur nombre sur le réseau de
        65'000 à quelques centaines.
    </section>

    <section class="prose flex gap-4 items-center">
        <p>
            J’ai conçu <a href="https://troc.io" target="_blank">Troc.io</a>,
            une plateforme de gestion de magasins éphémères intégrant un système
            de point de vente avancé, ainsi qu’un espace dédié aux clients et
            aux fournisseurs. L’application a été utilisée lors d’une dizaine
            d’événements et compte aujourd’hui plus de 1 800 utilisateurs.
        </p>

        <img src="/peufo/trocio.ico" alt="Logo Troc.io" class="mt-0 h-24" />
    </section>

    <section class="prose flex gap-6 items-center">
        <img src="/peufo/benevio.svg" alt="Logo benev.io" class="h-32" />

        <p class="mt-0">
            J’ai créé <a href="https://benev.io" target="_blank">Benev.io</a>,
            une plateforme de gestion de bénévoles. Elle facilite
            l’organisation, le suivi et la coordination des équipes bénévoles,
            et compte aujourd’hui près de 1 400 utilisateurs.
        </p>
    </section>
</div>
