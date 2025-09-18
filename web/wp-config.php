<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'wpuser' );

/** Database password */
define( 'DB_PASSWORD', 'password' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          'c,[`ex0y0}yBH4HnZbYqmoa^1N^S`w|WcNq_4&lUzC0K*VY&&3(D76v<sv-1!f)!' );
define( 'SECURE_AUTH_KEY',   '@Duk;B6kM/5jpilW1H<D]k7wvv7r/`zN:`wR C5aRcF{nZ2roo`ga^gdl]TC!.7,' );
define( 'LOGGED_IN_KEY',     'hb1i@EL|s+ m}6kK]iW(~*8QY9 R9^yJ3)j#Bdwt|X@>[^ |!%lV4q,m&P)seE4/' );
define( 'NONCE_KEY',         'qCMa/3&n_vK)dBX2sjo4M7z~&Q4*QlfdqN&4oo!Q@>)gJPa{d_N[`]Hy@xV2-@kq' );
define( 'AUTH_SALT',         '=Q $77(cb~D<(&UOA|S@!&h^|Jukm6k[C/qzkMXXTF4s5El@f-#f%).8=g>H?5il' );
define( 'SECURE_AUTH_SALT',  'h<uwF}65Tdm8Tg)(0-<1y;CLz:*^]i6aXf1I)(]M3#AHwkBJO3o.F;VDz7;uKMNY' );
define( 'LOGGED_IN_SALT',    'C]0zKLrJo+P=tfn3,,glr $cAQv,9w2l{PpQ${;odS`4eP8/c_*RoB,V!/W$%t_3' );
define( 'NONCE_SALT',        'TmG$YViT~ca5z-*Zj4j/bBt%77{rSY^.ZvEVx)<&??x5SUCp:MY4B]sqtA{HZl<R' );
define( 'WP_CACHE_KEY_SALT', 'G B4x3AQzG#=*=HDl+wT+pU8rH%N#:QvmCm5yU~WJB#Qg--abT4h(~%;g$F-6QUk' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
