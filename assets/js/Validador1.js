document.getElementById("miBton").addEventListener("click", function (e) {
    // Evitar el comportamiento por defecto del enlace
    e.preventDefault();
    //actualizarTotal();

    // Variables que almacenarán los valores del formulario
    const nombre = document.getElementById("contac_name").value;
    const email = document.getElementById("contac_email").value;
    const mensaje = document.getElementById("message").value;
    const telefono = document.getElementById("phone").value;
    const direccion = document.getElementById("address").value;

    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (!emailRegex.test(email)) {
        Swal.fire({
            icon: 'error',
            title: '¡Error!',
            text: 'Por favor, ingresa un correo electrónico válido.',
        });
    }
    // Validación de los campos
    else if (!nombre || !email || !mensaje || !telefono || !direccion) {
        // Si algún campo está vacío
        Swal.fire({
            icon: 'error',
            title: '¡Error!',
            text: 'Por favor, completa todos los campos requeridos.',
        });

    }
    else {
        // Si todo es válido
        Swal.fire({
            icon: 'success',
            title: '¡Formulario Enviado!',
            text: 'Gracias por enviar el formulario.',
        });

        // Si quieres que el formulario se envíe o realice otra acción:
        // document.getElementById("formulario").submit();



    }
});