<script lang="ts">
    import { themeChange } from 'theme-change';
    import '../app.css';
    import { onMount } from 'svelte';

    const { children } = $props();

    onMount(() => {
        themeChange(false);
    });
</script>

<main>
    <div class="max-w-xl m-auto">
        {@render children()}
    </div>
</main>
