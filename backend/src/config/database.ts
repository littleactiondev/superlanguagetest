import pg from 'pg';
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import dotenv from 'dotenv';

// Load environment variables
dotenv.config();

const { Pool } = pg;

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// Database configuration
export const pool = new Pool(
  process.env.DATABASE_URL
    ? {
        connectionString: process.env.DATABASE_URL,
        max: 20,
        idleTimeoutMillis: 30000,
        connectionTimeoutMillis: 2000,
      }
    : {
        host: process.env.DB_HOST || 'localhost',
        port: parseInt(process.env.DB_PORT || '5432'),
        database: process.env.DB_NAME || 'languagetest',
        user: process.env.DB_USER || 'postgres',
        password: process.env.DB_PASSWORD || 'postgres',
        max: 20,
        idleTimeoutMillis: 30000,
        connectionTimeoutMillis: 2000,
      }
);

// Test database connection
export async function testConnection() {
  try {
    const client = await pool.connect();
    console.log('✅ Database connected successfully');
    client.release();
    return true;
  } catch (error) {
    console.error('❌ Database connection failed:', error);
    return false;
  }
}

// Initialize database with migrations
export async function initializeDatabase() {
  try {
    console.log('🔧 Initializing database...');

    const migrationsDir = path.join(__dirname, '../../database/migrations');
    const seedsDir = path.join(__dirname, '../../database/seeds');

    // Run migrations
    const migrationFiles = fs.readdirSync(migrationsDir).sort();
    for (const file of migrationFiles) {
      if (file.endsWith('.sql')) {
        console.log(`Running migration: ${file}`);
        const sql = fs.readFileSync(path.join(migrationsDir, file), 'utf-8');
        try {
          await pool.query(sql);
        } catch (error: any) {
          // Ignore duplicate key errors (data already exists)
          if (error.code !== '23505') {
            throw error;
          }
          console.log(`  ⚠️  Some data already exists, skipping duplicates`);
        }
      }
    }

    // Run seeds
    if (fs.existsSync(seedsDir)) {
      const seedFiles = fs.readdirSync(seedsDir).sort();
      for (const file of seedFiles) {
        if (file.endsWith('.sql')) {
          console.log(`Running seed: ${file}`);
          const sql = fs.readFileSync(path.join(seedsDir, file), 'utf-8');
          try {
            await pool.query(sql);
          } catch (error: any) {
            // Ignore duplicate key errors (data already exists)
            if (error.code !== '23505') {
              throw error;
            }
            console.log(`  ⚠️  Some data already exists, skipping duplicates`);
          }
        }
      }
    }

    console.log('✅ Database initialized successfully');
  } catch (error) {
    console.error('❌ Database initialization failed:', error);
    throw error;
  }
}

export default pool;
