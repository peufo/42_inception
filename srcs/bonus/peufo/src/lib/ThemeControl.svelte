<script lang="ts">
    import { Moon, SunMedium } from 'lucide-svelte';
</script>

<button
    data-toggle-theme="cupcake,dim"
    data-act-class="swap-active"
    class="btn btn-square btn-ghost swap swap-rotate"
>
    <SunMedium class="swap-on fill-current" />
    <Moon class="swap-off fill-current" />
</button>
