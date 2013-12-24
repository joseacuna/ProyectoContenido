<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    <h1>Contenido</h1>
</head>
<body>
    <?php echo validation_errors(); ?>

    <?= form_open(base_url('index.php/contenido/crear')); ?>
    <?php
    $unidad = array(
        'name' => 'unidad',
        'id' => 'unidad',
        'placeholder' => 'Unidad',
        'value' => set_value('unidad')
    );
    $semanaAnual = array(
        'name' => 'semana_anual',
        'id' => 'semana_anual',
        'placeholder' => 'Semana',
        'value' => set_value('semana_anual')
    );
    $semanaSemestral = array(
        'name' => 'semana_semestral',
        'id' => 'semana_semestral',
        'placeholder' => 'Semana',
        'value' => set_value('semana_semestral')
    );
    $obj_esp = array(
        'name' => 'objetivos',
        'id' => 'objetivos',
        'placeholder' => 'Objetivos',
        'value' => set_value('objetivos')
    );

    $fechainicial = array(
        'name' => 'fechainicio',
        'type' => 'date',
        'value' => set_value('fechainicio')
    );

    $fechatermino = array(
        'name' => 'fechatermino',
        'type' => 'date',
        'value' => set_value('fechatermino')
    );
    $contTematico = array(
        'name' => 'ContenidoTematico',
        'id' => 'ContenidoTematico',
        'placeholder' => 'Contenido Tematico',
        'value' => set_value('ContenidoTematico')
    );
    $evaluaciones = array(
        'name' => 'evaluaciones',
        'id' => 'evaluaciones',
        'placeholder' => 'Evaluaciones',
        'value' => set_value('evaluaciones')
    );
    $boton = array(
        'name' => 'enviar',
        'id' => 'enviar',
        'value' => 'Enviar',
    );
    ?>

    <table>
        <tr>
            <td>
    <?= form_label('Unidad', 'unidad') ?>

<?= form_input($unidad) ?>
            </td>
        </tr>
        <tr>
            <td>
                <?= form_label('Semana Anual', 'semana') ?>
                <?= form_input($semanaAnual) ?>
            </td>
        </tr>
        <tr>
            <td>
                <?= form_label('Semana Semestral', 'semana') ?>
                <?= form_input($semanaSemestral) ?>
            </td>
        </tr>
        <tr>
            <td>
                <?= form_label('Fecha Inicio', 'fechainicio') ?>
                <?= form_input($fechainicial) ?>
            </td>
        </tr>
        <tr>
            <td>
                <?= form_label('Fecha Termino', 'fechatermino') ?>
                <?= form_input($fechatermino) ?>
            </td>
        </tr>
        <tr>
            <td>
                <?= form_label('Objetivo Especifico', 'obj_esp') ?>
                <?= form_input($obj_esp) ?>
            </td>
        <tr>
            <td>
                <?= form_label('Contenido Tematico', 'contTematico') ?>

                <?= form_input($contTematico) ?>
            </td>
        </tr>
        <tr>
            <td>
                <?= form_label('Evaluaciones', 'evaluaciones') ?>
                <?= form_input($evaluaciones) ?>

            </td>
        </tr>

    </table>

<?= form_hidden('planificacion', 1); ?>
<?= form_submit($boton) ?>

<?= form_close() ?>
</body>
</html>
