<?php

namespace App\Controller\Admin;

use App\Controller\AbstractController;
use App\Core\Session;
use App\Repository\UserRepository;

class AdminUserController extends AbstractController
{
    public function showUsers(): void
    {
        $session = new Session();

        if ($session->isAdmin() === false) {
            header('Location:/code-et-compote/');
            exit;
        }

        $repository = new UserRepository();
        $users = $repository->findAll();

        $this->render('admin/users', ['users' => $users]);
    }
    public function showUpdateUserForm($params)
    {
        $session = new Session();

        if ($session->isAdmin() === false) {
            header('Location:/code-et-compote/');
            exit;
        }
        $id = $params['id'];

        // Vérification si la variable n'est pas un entier
        if (filter_var($id, FILTER_VALIDATE_INT) === false) {
            // Redirection vers /code-et-compote/admin/utilisateurs si ce n'est pas un entier
            header("Location: /code-et-compote/admin/utilisateurs");
            exit(); // Toujours appeler exit() après une redirection pour stopper l'exécution du script
        }


        $this->render('admin/updateUserForm', ['id' => $id, 'user' => $user]);
    }
}
