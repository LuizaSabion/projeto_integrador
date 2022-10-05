function generateColors() {

    const chars = '0123456789ABCDEF'
    let color = '#'

    for(let i = 0; i < 6; i++) {
        color += chars.charAt(math.floor(math.random() * chars.length))
    }

    return color;

}

document.getElementById('btn-action').addEventListener('click', () => {
    let color = generateColors()
    for(let i = 0; i < 5; i++){
        let div_color = document.getElementById(`color-${i+1}`)
        div_color.style.backgroundColor = color     
        let txt_color = document.getElementById(`txt-color-${i+1}`)
        txt_color.textContent = `${color}`
    }
})