// frontend/pages/index.js
export const backendApiBaseUrl = process.env.NEXT_PUBLIC_API_BASE_URL;

const Home = () => {
    return (
        <div>
            <h1>Welcome to Next.js!</h1>
            <p>API Base URL: {backendApiBaseUrl}</p>
        </div>
    );
};

export default Home;
