var cores = [make_color_rgb(129, 246, 22), make_color_rgb(60, 180, 255), make_color_rgb(255, 90, 200)];
var alvos = [a1, a2, a3];

// Brilho nos alvos acertados e piscar vermelho no erro
for (var i = 0; i < 3; i++) {
    var a = alvos[i];
    var cx = a.x;
    var cy = a.y - a.alt / 2;
    if (acesos[i]) {
        draw_set_color(cores[i]);
        draw_set_alpha(0.25 + 0.15 * sin(current_time / 150));
        draw_circle(cx, cy, a.alt * 0.6, false);
        draw_set_alpha(0.9);
        draw_circle(cx, cy, 6, false);
    }
    if (erro_timer > 0 && ((erro_timer div 4) mod 2 == 0)) {
        draw_set_color(c_red);
        draw_set_alpha(0.35);
        draw_circle(cx, cy, a.alt * 0.6, false);
    }
}

// Indicador da sequência no topo
var nomes = ["if", "else if", "else"];
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_alpha(1);
draw_set_color(c_white);
draw_text(683, 24, aberto ? "PORTAO ABERTO!" : "Atire na ordem:");
for (var i = 0; i < 3; i++) {
    draw_set_color(acesos[i] ? cores[i] : c_gray);
    draw_text(683 + (i - 1) * 140, 50, nomes[i]);
}

// Volta ao normal
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);