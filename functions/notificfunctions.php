
<?php
if (isset($_POST['action'])) {
    $action = $_POST['action'];
    $id = intval($_POST['notification_id'] ?? 0);

    if ($action === 'mark_read' && $id > 0) {
        if (markRead($pdo, $id)) {
            $_SESSION['message'] = "Notificação marcada como lida";
        }
    }
    elseif ($action === 'mark_all_read') {
        if (markAllRead($pdo)) {
            $_SESSION['message'] = "Todas as notificações foram marcadas como lidas";
        }
    }
    elseif ($action === 'delete' && $id > 0) {
        if (deleteNotification($pdo, $id)) {
            $_SESSION['message'] = "Notificação removida";
        }
    }

    // Redirecionamento seguro
    $redirect_url = 'notifications.php';
    if (isset($_GET['type'])) {
        $redirect_url .= '?type=' . urlencode($_GET['type']);
    }
    header('Location: ' . $redirect_url);
    exit;
}

// Pega o filtro ativo, padrão 'all'
$activeTab = $_GET['type'] ?? 'all';

// Busca notificações conforme filtro
$notifications = getNotifications($pdo, $activeTab);

// Contagem de notificações não lidas por tipo
$allUnreadCount      = countUnread($pdo, 'all');
$academicUnreadCount = countUnread($pdo, 'academic');
$calendarUnreadCount = countUnread($pdo, 'calendar');
$materialsUnreadCount = countUnread($pdo, 'materials');

function getNotificationIcon($notification)
{
    if ($notification['type'] === 'academic') {
        switch ($notification['tipo_academico'] ?? '') {
            case 'homework': return '<i class="fa-solid fa-book text-primary"></i>';
            case 'exam': return '<i class="fa-solid fa-graduation-cap text-warning"></i>';
            case 'deadline': return '<i class="fa-solid fa-clock text-danger"></i>';
            case 'event': return '<i class="fa-solid fa-calendar-days text-success"></i>';
            default: return '<i class="fa-solid fa-graduation-cap text-danger"></i>';
        }
    }
    if ($notification['type'] === 'calendar') return '<i class="fa-solid fa-calendar-days text-danger"></i>';
    if ($notification['type'] === 'materials') return '<i class="fa-solid fa-book text-danger"></i>';
    return '<i class="fa-solid fa-bell text-danger"></i>';
}

function getPriorityIcon($priority)
{
    return match ($priority) {
        'high' => '<i class="fa-solid fa-exclamation-circle text-danger"></i>',
        'medium' => '<i class="fa-solid fa-info-circle text-warning"></i>',
        default => '<i class="fa-solid fa-info-circle text-success"></i>',
    };
}
