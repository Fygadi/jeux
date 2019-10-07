

void VerifieFlipEnplacement(int x, int y)
{
  // Joueur doit captuer piece de l adversion si non il passe son tour.

	// Verifier que la case que le joueur a selectionner permet de touner au moin une piece de l adversaire.

	boolean coupAccepter = false;

	for (int dir=0; dir<8; dir++)
	{
		if (nombrePieceCapturer(x,y,couleur, dir) > 0
		{
		   coupAccepter = true;
		   break;
		}
	}

	if (coupAccepter == false)
	{
		print ("REFUSER !!!")
	}
	else
	{
		// FLIP LES PICES
		int nbPiece;
		for (int dir=0; dir<8; dir++)
		{
			nbPiece = nombrePieceCapturer(x,y,couleur, dir);
			flipPieces (x, y, couleur, dir, nbPiece);
		}
	}
}



// IN: x : Position X de la piece que le joueur veux jouer.
//     y : Position Y de la piece que le joueur veux jouer.
//     couleur:         Couleur de la piece du joueur
//     dir:             1 des 8 Direction possible
// OUT Retourne le nombre de piece capturer
//
int nombrePieceCapturer(int x, int y, int couleur, int direction)
{

//  Notation pour les 8 direction possible
//
//        7     0     1
//         ╲    │    ╱
//          ╲   │   ╱
//           ╲  │  ╱
//            ━━━━━
//  6 <────── ┃ X | ──────> 2
//            ━━━━━
//           ╱  │  ╲
//          ╱   │   ╲
//         ╱    │    ╲
//         5    4     3


	// Trouve nombre  piece capturer
	int nbPiece = 0;
	int i, j;


	switch (direction)
	{

		case 0: // Direction: 0
		{
			for (int j=y-1; j>= 0; j--)
			{
				if (matrice[x,j] == couleur)
				{
					nbPiece = y-j-1 ;
					break;
				}
				else if (matrice[x,j] == "vide")
				{
					break;
				}
			}
		}
		break;

		case 1: // Direction: 1
		{
			for (int i=x+1, j=y-1; i < MAX && j>=0; i++, j--)
			{
				if (matrice[i,j] == couleur)
				{
					nbPiece = y-j-1;
					break;
				}
				else if (matrice[i,j] == "vide")
				{
					break;
				}
			}
		}
		break;

		case 2: // Direction: 2
		{
			for (int i=x+1; i<MAX; i++)
			{
				if (matrice[i,y] == couleur)
				{
					// Au moin un piece de capturer
					nbPiece = i-x-1;
					break;
				}
				else if (matrice[i,y] == "vide")
				{
					break;
				}
			}
		}
		break;

		case 3: // Direction: 3
		{
			for (int i=x+1, j=y+1; i < MAX && j<MAX; i++, j++)
			{
				if (matrice[i,j] == couleur)
				{
					nbPiece = j-y-1;
					break;
				}
				else if (matrice[i,j] == "vide")
				{
					break;
				}
			}
		}
		break;

		case 4: // Direction: 4
		{
			for (int j=y+1; j<MAX; j++)
			{
				if (matrice[x,j] == couleur)
				{
					nbPiece = j-y-1;
					break;
				}
				else if (matrice[x,j] == "vide")
				{
					break;
				}
			}
		}
		break;

		case 5: // Direction: 5
		{
			for (int i=x-1, j=y-1; i >= 0 && j>= 0; i--, j--)
			{
				if (matrice[i,j] == couleur)
				{
					nbPiece = y-j-1;
					break;
				}
				else if (matrice[i,j] == "vide")
				{
					break;
				}
			}
		}
		break;

		case 6: // Direction: 6
		{
			for (int i=x-1; i>= 0; i--)
			{
				if (matrice[i,y] == couleur)
				{
					nbPiece = x-i-1;
					break;
				}
				else if (matrice[i,y] == "vide")
				{
					break;
				}
			}
		}
		break;

		case 7: // Direction: 7
		{
			for (int i=x-1, j=y+1; i >= 0 && j<MAX; i--, j++)
			{
				if (matrice[i,j] == couleur)
				{
					nbPiece = i-y-1;
					break;
				}
				else if (matrice[i,j] == "vide")
				{
					break;
				}
			}
		}
		break;

		default:
	}

	return (nbPiece);
}



// IN: x :              Position X de la piece que le joueur joue.
//     y :              Position Y de la piece que le joueur joue.
//     couleur:         Couleur de la piece du joueur
//     dir:             1 des 8 Direction possible
//     nombrePieceFlip: Nombre de piece a flipper
void flipPieces (int x, int y, int couleur, int dir, int nombrePieceFlip)
{

	//  Notation pour les 8 direction possible
	//
	//        7     0     1
	//         ╲    │    ╱
	//          ╲   │   ╱
	//           ╲  │  ╱
	//            ━━━━━
	//  6 <────── ┃ X | ──────> 2
	//            ━━━━━
	//           ╱  │  ╲
	//          ╱   │   ╲
	//         ╱    │    ╲
	//         5    4     3

	int i, j;
	int idx;

	switch (direction)
	{

		case 0: // Direction: 0
		{
			j=y-1;
			for (idx=0; idx<nombrePieceFlip;idx++)
			{
				matrice[x,j] = couleur;
				j--;
			}
		}
		break;

		case 1: // Direction: 1
		{
			i=x+1;
			j=y-1
			for (idx=0; idx<nombrePieceFlip;idx++)
			{
				matrice[i,j] = couleur;
				i++;
				j--;
			}
		}
		break;

		case 2: // Direction: 2
		{
			i=x+1;
			for (idx=0; idx<nombrePieceFlip;idx++)
			{
				matrice[i,y] = couleur;
				i++;
			}
		}
		break;

		case 3: // Direction: 3
		{
			i=x+1;
			j=y+1;
			for (idx=0; idx<nombrePieceFlip;idx++)
			{
				matrice[i,j] = couleur;
				i++;
				j++;
			}
		}
		break;

		case 4: // Direction: 4
		{
			j=y+1;
			for (idx=0; idx<nombrePieceFlip;idx++)
			{
				matrice[x,j] = couleur;
				j++;
			}
		}
		break;

		case 5: // Direction: 5
		{
			i=x-1;
			j=y-1;
			for (idx=0; idx<nombrePieceFlip;idx++)
			{
				matrice[i,j] = couleur;
				i--;
				j--;
			}
		}
		break;

		case 6: // Direction: 6
		{
			i=x-1;
			for (idx=0; idx<nombrePieceFlip;idx++)
			{
				matrice[i,y] = couleur;
				i--;
			}
		}
		break;

		case 7: // Direction: 7
		{
			i=x-1;
			j=y+1;
			for (idx=0; idx<nombrePieceFlip;idx++)
			{
				matrice[i,j] = couleur;
				i--;
				j++;
			}
		}
		break;

		default:
	}
}
