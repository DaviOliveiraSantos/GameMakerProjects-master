proximo = 1;                          // 1 = if, 2 = else if, 3 = else
acesos = [false, false, false];
erro_timer = 0;
flash = 0;
aberto = false;
depth = -200;

// Alvos: posição (x, base y), tamanho e ordem
var lay = "Instances_1";
a1 = instance_create_layer(243, 445, lay, obj_alvo);  a1.ordem = 1;  a1.larg = 70;  a1.alt = 140;
a2 = instance_create_layer(1245, 515, lay, obj_alvo); a2.ordem = 2;  a2.larg = 70;  a2.alt = 130;
a3 = instance_create_layer(683, 545, lay, obj_alvo);  a3.ordem = 3;  a3.larg = 110; a3.alt = 120;

// Chamado por cada alvo que leva um tiro
acertou = function(o) {
    if (aberto) return;
    if (o == proximo) {
        acesos[o - 1] = true;
        proximo++;
        flash = 15;
        if (proximo > 3) abrir();
    } else {
        // Errou a ordem: apaga tudo e recomeça
        acesos = [false, false, false];
        proximo = 1;
        erro_timer = 40;
    }
};

// Abre o portão: aparece o portal
abrir = function() {
    aberto = true;
    flash = 40;
    var p = instance_create_layer(683, 704, "Instances_1", obj_saida);
    p.destino = rm_fase_5;
    p.larg = 120;
    p.alt = 260;
};