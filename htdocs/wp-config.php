<?php
// Use these settings on the local server
if ( file_exists( dirname( __FILE__ ) . '/wp-config-local.php' ) ) {
include( dirname( __FILE__ ) . '/wp-config-local.php' );
}
else
{
/**
 * In dieser Datei werden die Grundeinstellungen für WordPress vorgenommen.
 *
 * Zu diesen Einstellungen gehören: MySQL-Zugangsdaten, Tabellenpräfix,
 * Secret-Keys, Sprache und ABSPATH. Mehr Informationen zur wp-config.php gibt es auf der {@link http://codex.wordpress.org/Editing_wp-config.php
 * wp-config.php editieren} Seite im Codex. Die Informationen für die MySQL-Datenbank bekommst du von deinem Webhoster.
 *
 * Diese Datei wird von der wp-config.php-Erzeugungsroutine verwendet. Sie wird ausgeführt, wenn noch keine wp-config.php (aber eine wp-config-sample.php) vorhanden ist,
 * und die Installationsroutine (/wp-admin/install.php) aufgerufen wird.
 * Man kann aber auch direkt in dieser Datei alle Eingaben vornehmen und sie von wp-config-sample.php in wp-config.php umbenennen und die Installation starten.
 *
 * @package WordPress
 */

/**  MySQL Einstellungen - diese Angaben bekommst du von deinem Webhoster. */
/**  Ersetze database_name_here mit dem Namen der Datenbank, die du verwenden möchtest. */
define('DB_NAME', '*');

/** Ersetze username_here mit deinem MySQL-Datenbank-Benutzernamen */
define('DB_USER', '*');

/** Ersetze password_here mit deinem MySQL-Passwort */
define('DB_PASSWORD', '*');
}
/** Ersetze localhost mit der MySQL-Serveradresse */
define('DB_HOST', 'localhost');

/** Der Datenbankzeichensatz der beim Erstellen der Datenbanktabellen verwendet werden soll */
define('DB_CHARSET', 'utf8');

/** Der collate type sollte nicht geändert werden */
define('DB_COLLATE', '');

/**#@+
 * Sicherheitsschlüssel
 *
 * Ändere jeden KEY in eine beliebige, möglichst einzigartige Phrase. 
 * Auf der Seite {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service} kannst du dir alle KEYS generieren lassen.
 * Bitte trage für jeden KEY eine eigene Phrase ein. Du kannst die Schlüssel jederzeit wieder ändern, alle angemeldeten Benutzer müssen sich danach erneut anmelden.
 *
 * @seit 2.6.0
 */
define('AUTH_KEY',         'J~yG tO>;J0+fl~5fP|p<O3+D9K{RFM]F~BF|#[1C:FWv/o1wj U|6uC2C}ySN^a');
define('SECURE_AUTH_KEY',  '}mXpfM0}|X+je[ ktEw-O$p4}Ep@]7,7=5KzUQHd_2L7x/~FA|P/R)Rm3)v40Sp+');
define('LOGGED_IN_KEY',    'aGT1V;kcG4(@j/Rk@c.WeJoc{+b,VsI(]]JaI`6~t ua NP;Qa[mSV>*eE+G+-[j');
define('NONCE_KEY',        'CK/8UOiQ!{myOowYWMuB,&+)et;75{zyB#?k+&V1n,uSomAsOt+(;qN /9(|`+{|');
define('AUTH_SALT',        'gFV~uFxl4c7myKy<]hr+0~?>m-.3pII`M,No|5&4G4!U*;w7+l1R:g~+%Seo<Bas');
define('SECURE_AUTH_SALT', '-@B4l$>)m%Z-8cM} |Zj$Poei)l8kuUYW65QRR?v/7p6jrZhn@$bXi|6j$C3m-1p');
define('LOGGED_IN_SALT',   '8i7(XAsIJ11^$2.pv03X+:rU65#-uk*s5LTuo0}8z (,a-9+o)l/GXeJGp9Y@a^I');
define('NONCE_SALT',       '+O@1OnU+hKq-NX/s[#*L0JH[`UOS2-V]Az^%@B,-J`,cf;3|h<)j/Q)I5`NO|$hj');

/**#@-*/

/**
 * WordPress Datenbanktabellen-Präfix
 *
 *  Wenn du verschiedene Präfixe benutzt, kannst du innerhalb einer Datenbank
 *  verschiedene WordPress-Installationen betreiben. Nur Zahlen, Buchstaben und Unterstriche bitte!
 */
$table_prefix  = 'wp_';

/**
 * WordPress Sprachdatei
 *
 * Hier kannst du einstellen, welche Sprachdatei benutzt werden soll. Die entsprechende
 * Sprachdatei muss im Ordner wp-content/languages vorhanden sein, beispielsweise de_DE.mo
 * Wenn du nichts einträgst, wird Englisch genommen.
 */
define('WPLANG', 'de_DE');

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');