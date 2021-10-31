//Botones
const $modificar = document.querySelector("#modificar");
const $cancelar = document.querySelector("#cancelar");
const $submit = document.querySelector("#submit");

//Inputs
const $ID = document.querySelector("#ID");
const $img = document.querySelector("#Img");
const $categoria = document.querySelector("#Categoria");
const $name = document.querySelector("#Nombre");
const $compra = document.querySelector("#PrecioC");
const $stock = document.querySelector("#Stock");
const $descrip = document.querySelector("#Descripcion");
const $venta = document.querySelector("#PrecioV");

//Atributos de inicio
$cancelar.style.display = "none";
$submit.style.display = "none"

$ID.disabled = true;
$img.disabled = true;
$categoria.disabled = true;
$name.disabled = true;
$compra.disabled = true;
$stock.disabled = true;
$descrip.disabled = true;
$venta.disabled = true;

//Metodos
$modificar.onclick = (event) => {
    event.preventDefault();
    //inputs
    $ID.disabled = false;
    $img.disabled = false;
    $categoria.disabled = false;
    $name.disabled = false;
    $compra.disabled = false;
    $stock.disabled = false;
    $descrip.disabled = false;
    $venta.disabled = false;
    //Botones
    $cancelar.style.display = "block";
    $submit.style.display = "block";
    $modificar.style.display = "none";
}
$cancelar.onclick = (event) => {
    event.preventDefault();
    //inputs
    $ID.disabled = true;
    $img.disabled = true;
    $categoria.disabled = true;
    $name.disabled = true;
    $compra.disabled = true;
    $stock.disabled = true;
    $descrip.disabled = true;
    $venta.disabled = true;
    //Botones
    $cancelar.style.display = "none";
    $submit.style.display = "none";
    $modificar.style.display = "block";
}