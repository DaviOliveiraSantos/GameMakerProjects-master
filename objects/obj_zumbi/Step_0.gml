if (dano_timer > 0) dano_timer--;
var hsp = 0;

if (estado == "vivo") {
    if (instance_exists(obj_david)) {
        var dist = obj_david.x - x;
        if (abs(dist) > 4) facing = sign(dist);
        if (dano_timer <= 0) hsp = facing * vel;

        if (place_meeting(x, y, obj_david)) {
            with (obj_david) levar_dano();
        }
    }
    if (hp <= 0) {
        estado = "morrendo";
        global.tutorial_zumbi_morto = true;
    }
}

// gravidade e chão
vsp += grav;
if (place_meeting(x + hsp, y, obj_solido)) {
    while (!place_meeting(x + sign(hsp), y, obj_solido)) x += sign(hsp);
    hsp = 0;
}
x += hsp;
if (place_meeting(x, y + vsp, obj_solido)) {
    while (!place_meeting(x, y + sign(vsp), obj_solido)) y += sign(vsp);
    vsp = 0;
}
y += vsp;

// morte: some aos poucos (depois trocamos pela animação de morte)
if (estado == "morrendo") {
    morte_timer++;
    image_alpha = max(0, 1 - morte_timer / 45);
    if (morte_timer >= 45) instance_destroy();
}

// visual
image_blend = (dano_timer > 0) ? c_red : c_white;
image_xscale = facing * lado_original * escala;
image_yscale = escala;